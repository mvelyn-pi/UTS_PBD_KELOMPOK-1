
-- FILE: procedure_rekap_nilai.sql
-- Stored Procedure Sistem Rekap Nilai Praktikum Mahasiswa
-- Mencakup: variabel, percabangan, perulangan,
--           implicit cursor, explicit cursor, cursor+parameter

USE uts_pbd_kelompok_01;

-- Pastikan delimiter diubah agar procedure tidak terputus
DELIMITER $$

-- DROP PROCEDURE jika sudah ada (agar bisa dijalankan ulang)
DROP PROCEDURE IF EXISTS rekap_semua_nilai $$
DROP PROCEDURE IF EXISTS rekap_nilai_per_mk $$

-- PROCEDURE 1 : rekap_semua_nilai()
-- Mencakup:
--   - Variabel lokal
--   - Percabangan (CASE) untuk grade & status
--   - Perulangan (LOOP)
--   - Implicit cursor (ROW_COUNT)
--   - Explicit cursor (DECLARE CURSOR)
--   - Insert ke log_rekap_nilai
CREATE PROCEDURE rekap_semua_nilai()
BEGIN
    -- DEKLARASI VARIABEL LOKAL
    DECLARE v_nim          VARCHAR(15);
    DECLARE v_kode_mk      VARCHAR(10);
    DECLARE v_nilai_tugas  DECIMAL(5,2);
    DECLARE v_nilai_kuis   DECIMAL(5,2);
    DECLARE v_nilai_uts    DECIMAL(5,2);

    DECLARE v_nilai_akhir  DECIMAL(5,2);
    DECLARE v_grade        VARCHAR(3);
    DECLARE v_bobot        DECIMAL(4,2);
    DECLARE v_status_lulus VARCHAR(15);
    DECLARE v_keterangan   VARCHAR(255);

    DECLARE v_total_diproses INT DEFAULT 0;
    DECLARE done           BOOLEAN DEFAULT FALSE;

    -- DEKLARASI EXPLICIT CURSOR
    -- Membaca semua baris dari nilai_praktikum
    DECLARE cur_nilai CURSOR FOR
        SELECT nim, kode_mk, nilai_tugas, nilai_kuis, nilai_uts
        FROM nilai_praktikum;

    -- HANDLER NOT FOUND  →  implicit cursor attribute
    -- Menandai akhir pembacaan cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- BUKA CURSOR
    OPEN cur_nilai;

    -- PERULANGAN : LOOP
    baca_loop: LOOP

        -- Ambil satu baris dari cursor ke variabel lokal
        FETCH cur_nilai INTO v_nim, v_kode_mk,
                             v_nilai_tugas, v_nilai_kuis, v_nilai_uts;

        -- Jika sudah tidak ada baris, keluar dari loop
        IF done THEN
            LEAVE baca_loop;
        END IF;

        -- HITUNG NILAI AKHIR (menggunakan variabel)
        -- Rumus: (tugas*30%) + (kuis*30%) + (uts*40%)
        SET v_nilai_akhir = (v_nilai_tugas * 0.30)
                          + (v_nilai_kuis  * 0.30)
                          + (v_nilai_uts   * 0.40);

        -- PERCABANGAN : tentukan GRADE & BOBOT
        -- Menggunakan CASE sesuai ketentuan soal
        SET v_grade = CASE
            WHEN v_nilai_akhir >= 93.00 THEN 'A'
            WHEN v_nilai_akhir >= 85.00 THEN 'A-'
            WHEN v_nilai_akhir >= 81.00 THEN 'B+'
            WHEN v_nilai_akhir >= 75.00 THEN 'B'
            WHEN v_nilai_akhir >= 71.00 THEN 'B-'
            WHEN v_nilai_akhir >= 66.00 THEN 'C+'
            WHEN v_nilai_akhir >= 61.00 THEN 'C'
            WHEN v_nilai_akhir >= 56.00 THEN 'C-'
            WHEN v_nilai_akhir >= 40.00 THEN 'D'
            ELSE                             'E'
        END;

        -- Ambil bobot dari tabel grade_nilai
        SELECT bobot INTO v_bobot
        FROM grade_nilai
        WHERE grade = v_grade
        LIMIT 1;

        -- PERCABANGAN : tentukan STATUS KELULUSAN
        -- Menggunakan IF … ELSEIF … ELSE
        IF v_grade IN ('A', 'A-', 'B+', 'B', 'B-', 'C+', 'C') THEN
            SET v_status_lulus = 'LULUS';
        ELSE
            SET v_status_lulus = 'TIDAK LULUS';
        END IF;

        -- UPDATE tabel nilai_praktikum
        UPDATE nilai_praktikum
        SET nilai_akhir  = v_nilai_akhir,
            grade        = v_grade,
            bobot        = v_bobot,
            status_lulus = v_status_lulus
        WHERE nim     = v_nim
          AND kode_mk = v_kode_mk;

        -- IMPLICIT CURSOR : catat jumlah baris yang diperbarui
        -- ROW_COUNT() mengembalikan jumlah baris yg terdampak
        -- oleh UPDATE terakhir (implicit cursor MySQL)
        SET v_total_diproses = v_total_diproses + ROW_COUNT();

        -- INSERT ke tabel log_rekap_nilai
        SET v_keterangan = CONCAT(
            'Rekap semua nilai | NIM: ', v_nim,
            ' | MK: ', v_kode_mk,
            ' | Nilai Akhir: ', v_nilai_akhir,
            ' | Grade: ', v_grade,
            ' | Status: ', v_status_lulus
        );

        INSERT INTO log_rekap_nilai
            (nim, kode_mk, nilai_akhir, grade, bobot, status_lulus, keterangan, waktu_proses)
        VALUES
            (v_nim, v_kode_mk, v_nilai_akhir, v_grade, v_bobot,
             v_status_lulus, v_keterangan, NOW());

    END LOOP baca_loop;

    -- TUTUP CURSOR
    CLOSE cur_nilai;

    -- TAMPILKAN JUMLAH DATA YANG BERHASIL DIPROSES
    -- Ini adalah hasil dari implicit cursor (akumulasi ROW_COUNT)
    SELECT v_total_diproses AS jumlah_data_diproses,
           'rekap_semua_nilai() selesai dijalankan.' AS keterangan;

END $$


-- PROCEDURE 2 : rekap_nilai_per_mk(p_kode_mk)
-- Cursor dengan Parameter → filter berdasarkan kode_m
-- Pada MySQL, cursor tidak menerima parameter langsung.
-- Parameter dibuat pada stored procedure, lalu digunakan
-- pada query SELECT di dalam CURSOR DECLARE.
CREATE PROCEDURE rekap_nilai_per_mk(IN p_kode_mk VARCHAR(10))
BEGIN
    -- DEKLARASI VARIABEL LOKAL
    DECLARE v_nim          VARCHAR(15);
    DECLARE v_nilai_tugas  DECIMAL(5,2);
    DECLARE v_nilai_kuis   DECIMAL(5,2);
    DECLARE v_nilai_uts    DECIMAL(5,2);

    DECLARE v_nilai_akhir  DECIMAL(5,2);
    DECLARE v_grade        VARCHAR(3);
    DECLARE v_bobot        DECIMAL(4,2);
    DECLARE v_status_lulus VARCHAR(15);
    DECLARE v_keterangan   VARCHAR(255);

    DECLARE v_total_diproses INT DEFAULT 0;
    DECLARE done           BOOLEAN DEFAULT FALSE;

    -- DEKLARASI CURSOR DENGAN PARAMETER (via procedure param)
    -- Hanya membaca baris dengan kode_mk = p_kode_mk
    DECLARE cur_nilai_mk CURSOR FOR
        SELECT nim, nilai_tugas, nilai_kuis, nilai_uts
        FROM nilai_praktikum
        WHERE kode_mk = p_kode_mk;

    -- Handler NOT FOUND
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- BUKA CURSOR
    OPEN cur_nilai_mk;

    -- PERULANGAN : LOOP
    baca_loop_mk: LOOP

        FETCH cur_nilai_mk INTO v_nim,
                                v_nilai_tugas, v_nilai_kuis, v_nilai_uts;

        IF done THEN
            LEAVE baca_loop_mk;
        END IF;

        -- HITUNG NILAI AKHIR (menggunakan variabel)
        SET v_nilai_akhir = (v_nilai_tugas * 0.30)
                          + (v_nilai_kuis  * 0.30)
                          + (v_nilai_uts   * 0.40);

        -- PERCABANGAN CASE : GRADE & BOBOT
        SET v_grade = CASE
            WHEN v_nilai_akhir >= 93.00 THEN 'A'
            WHEN v_nilai_akhir >= 85.00 THEN 'A-'
            WHEN v_nilai_akhir >= 81.00 THEN 'B+'
            WHEN v_nilai_akhir >= 75.00 THEN 'B'
            WHEN v_nilai_akhir >= 71.00 THEN 'B-'
            WHEN v_nilai_akhir >= 66.00 THEN 'C+'
            WHEN v_nilai_akhir >= 61.00 THEN 'C'
            WHEN v_nilai_akhir >= 56.00 THEN 'C-'
            WHEN v_nilai_akhir >= 40.00 THEN 'D'
            ELSE                             'E'
        END;

        SELECT bobot INTO v_bobot
        FROM grade_nilai
        WHERE grade = v_grade
        LIMIT 1;

        -- PERCABANGAN IF : STATUS KELULUSAN
        IF v_grade IN ('A', 'A-', 'B+', 'B', 'B-', 'C+', 'C') THEN
            SET v_status_lulus = 'LULUS';
        ELSE
            SET v_status_lulus = 'TIDAK LULUS';
        END IF;

        -- UPDATE tabel nilai_praktikum
        UPDATE nilai_praktikum
        SET nilai_akhir  = v_nilai_akhir,
            grade        = v_grade,
            bobot        = v_bobot,
            status_lulus = v_status_lulus
        WHERE nim     = v_nim
          AND kode_mk = p_kode_mk;

        -- IMPLICIT CURSOR : ROW_COUNT()
        SET v_total_diproses = v_total_diproses + ROW_COUNT();

        -- INSERT log_rekap_nilai
        SET v_keterangan = CONCAT(
            'Rekap per MK | MK: ', p_kode_mk,
            ' | NIM: ', v_nim,
            ' | Nilai Akhir: ', v_nilai_akhir,
            ' | Grade: ', v_grade,
            ' | Status: ', v_status_lulus
        );

        INSERT INTO log_rekap_nilai
            (nim, kode_mk, nilai_akhir, grade, bobot, status_lulus, keterangan, waktu_proses)
        VALUES
            (v_nim, p_kode_mk, v_nilai_akhir, v_grade, v_bobot,
             v_status_lulus, v_keterangan, NOW());

    END LOOP baca_loop_mk;

    -- TUTUP CURSOR
    CLOSE cur_nilai_mk;

    -- TAMPILKAN HASIL
    SELECT v_total_diproses        AS jumlah_data_diproses,
           p_kode_mk               AS mata_kuliah,
           CONCAT('rekap_nilai_per_mk(''', p_kode_mk, ''') selesai.')
                                   AS keterangan;

END $$

DELIMITER ;

SELECT 'Semua stored procedure berhasil dibuat.' AS info;

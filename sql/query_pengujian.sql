-- FILE: query_pengujian.sql
-- Query Pengujian Sistem Rekap Nilai Praktikum Mahasiswa

USE uts_pbd_kelompok_01;

-- A. TAMPILKAN DATA AWAL (sebelum procedure dijalankan)

-- 1. Data Mahasiswa
SELECT '=== DATA MAHASISWA ===' AS info;
SELECT * FROM mahasiswa ORDER BY nim;

-- 2. Data Dosen
SELECT '=== DATA DOSEN ===' AS info;
SELECT * FROM dosen;

-- 3. Data Mata Kuliah
SELECT '=== DATA MATA KULIAH ===' AS info;
SELECT mk.kode_mk, mk.nama_mk, mk.sks, mk.semester,
       d.nama_dosen
FROM mata_kuliah mk
JOIN dosen d ON mk.kode_dosen = d.kode_dosen;

-- 4. Standar Grade
SELECT '=== STANDAR GRADE ===' AS info;
SELECT * FROM grade_nilai ORDER BY bobot DESC;

-- 5. Data Nilai Praktikum (SEBELUM rekap)
SELECT '=== DATA NILAI PRAKTIKUM (SEBELUM REKAP) ===' AS info;
SELECT np.id_nilai, np.nim, m.nama, np.kode_mk,
       np.nilai_tugas, np.nilai_kuis, np.nilai_uts,
       np.nilai_akhir, np.grade, np.bobot, np.status_lulus
FROM nilai_praktikum np
JOIN mahasiswa m ON np.nim = m.nim
ORDER BY np.nim, np.kode_mk;

-- 6. Log Rekap (harus kosong di awal)
SELECT '=== LOG REKAP NILAI (SEBELUM REKAP - harus kosong) ===' AS info;
SELECT * FROM log_rekap_nilai;

-- B. JALANKAN PROCEDURE REKAP SEMUA NILAI
--    Mencakup: variabel, percabangan, perulangan,
--              implicit cursor, explicit cursor
SELECT '=== MENJALANKAN: CALL rekap_semua_nilai() ===' AS info;
CALL rekap_semua_nilai();

-- 7. Cek nilai_praktikum setelah rekap semua
SELECT '=== DATA NILAI PRAKTIKUM (SETELAH rekap_semua_nilai) ===' AS info;
SELECT np.id_nilai, np.nim, m.nama, np.kode_mk,
       np.nilai_tugas, np.nilai_kuis, np.nilai_uts,
       np.nilai_akhir, np.grade, np.bobot, np.status_lulus
FROM nilai_praktikum np
JOIN mahasiswa m ON np.nim = m.nim
ORDER BY np.nim, np.kode_mk;

-- 8. Cek log setelah rekap semua
SELECT '=== LOG REKAP NILAI (SETELAH rekap_semua_nilai) ===' AS info;
SELECT * FROM log_rekap_nilai ORDER BY id_log;

-- C. JALANKAN PROCEDURE REKAP PER MATA KULIAH
--    Mencakup: cursor dengan parameter

-- Bersihkan log & reset nilai agar pengujian per MK bisa terlihat jelas
TRUNCATE TABLE log_rekap_nilai;
UPDATE nilai_praktikum
SET nilai_akhir = NULL, grade = NULL, bobot = NULL, status_lulus = NULL;

SELECT '=== MENJALANKAN: CALL rekap_nilai_per_mk(''MK001'') ===' AS info;
CALL rekap_nilai_per_mk('MK001');

SELECT '=== MENJALANKAN: CALL rekap_nilai_per_mk(''MK002'') ===' AS info;
CALL rekap_nilai_per_mk('MK002');

SELECT '=== MENJALANKAN: CALL rekap_nilai_per_mk(''MK003'') ===' AS info;
CALL rekap_nilai_per_mk('MK003');

-- 9. Cek nilai_praktikum setelah rekap per MK
SELECT '=== DATA NILAI PRAKTIKUM (SETELAH rekap_nilai_per_mk) ===' AS info;
SELECT np.id_nilai, np.nim, m.nama, np.kode_mk,
       np.nilai_tugas, np.nilai_kuis, np.nilai_uts,
       np.nilai_akhir, np.grade, np.bobot, np.status_lulus
FROM nilai_praktikum np
JOIN mahasiswa m ON np.nim = m.nim
ORDER BY np.kode_mk, np.nim;

-- 10. Cek log setelah rekap per MK
SELECT '=== LOG REKAP NILAI (SETELAH rekap_nilai_per_mk) ===' AS info;
SELECT * FROM log_rekap_nilai ORDER BY kode_mk, id_log;

-- D. QUERY TAMBAHAN - Statistik & Ringkasan

-- Rekap statistik per mata kuliah
SELECT '=== STATISTIK NILAI PER MATA KULIAH ===' AS info;
SELECT np.kode_mk, mk.nama_mk,
       COUNT(*)                         AS jumlah_mahasiswa,
       ROUND(AVG(np.nilai_akhir), 2)    AS rata_rata_nilai,
       MAX(np.nilai_akhir)              AS nilai_tertinggi,
       MIN(np.nilai_akhir)              AS nilai_terendah,
       SUM(np.status_lulus = 'LULUS')         AS jumlah_lulus,
       SUM(np.status_lulus = 'TIDAK LULUS')   AS jumlah_tidak_lulus
FROM nilai_praktikum np
JOIN mata_kuliah mk ON np.kode_mk = mk.kode_mk
GROUP BY np.kode_mk, mk.nama_mk;

-- Distribusi grade
SELECT '=== DISTRIBUSI GRADE ===' AS info;
SELECT grade,
       COUNT(*) AS jumlah,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM nilai_praktikum), 1)
           AS persentase
FROM nilai_praktikum
GROUP BY grade
ORDER BY bobot DESC;

SELECT 'Pengujian selesai.' AS info;

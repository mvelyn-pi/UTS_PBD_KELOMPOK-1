
-- FILE: database.sql
-- Sistem Rekap Nilai Praktikum Mahasiswa
-- UTS Pemrograman Basis Data

-- Buat dan gunakan database
CREATE DATABASE IF NOT EXISTS uts_pbd_kelompok_01;
USE uts_pbd_kelompok_01;

-- 1. TABEL DOSEN
CREATE TABLE IF NOT EXISTS dosen (
    kode_dosen  VARCHAR(10)  NOT NULL,
    nama_dosen  VARCHAR(100) NOT NULL,
    email       VARCHAR(100) NOT NULL,
    CONSTRAINT pk_dosen PRIMARY KEY (kode_dosen)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2. TABEL MAHASISWA
CREATE TABLE IF NOT EXISTS mahasiswa (
    nim      VARCHAR(15)  NOT NULL,
    nama     VARCHAR(100) NOT NULL,
    kelas    VARCHAR(10)  NOT NULL,
    angkatan YEAR         NOT NULL,
    CONSTRAINT pk_mahasiswa PRIMARY KEY (nim)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3. TABEL MATA_KULIAH
CREATE TABLE IF NOT EXISTS mata_kuliah (
    kode_mk    VARCHAR(10)  NOT NULL,
    nama_mk    VARCHAR(100) NOT NULL,
    sks        TINYINT      NOT NULL,
    semester   TINYINT      NOT NULL,
    kode_dosen VARCHAR(10)  NOT NULL,
    CONSTRAINT pk_mata_kuliah  PRIMARY KEY (kode_mk),
    CONSTRAINT fk_mk_dosen     FOREIGN KEY (kode_dosen)
        REFERENCES dosen(kode_dosen)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4. TABEL GRADE_NILAI
CREATE TABLE IF NOT EXISTS grade_nilai (
    grade       VARCHAR(3)     NOT NULL,
    bobot       DECIMAL(4,2)   NOT NULL,
    nilai_bawah DECIMAL(6,2)   NOT NULL,
    nilai_atas  DECIMAL(6,2)   NOT NULL,
    CONSTRAINT pk_grade PRIMARY KEY (grade)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 5. TABEL NILAI_PRAKTIKUM
CREATE TABLE IF NOT EXISTS nilai_praktikum (
    id_nilai     INT            NOT NULL AUTO_INCREMENT,
    nim          VARCHAR(15)    NOT NULL,
    kode_mk      VARCHAR(10)    NOT NULL,
    nilai_tugas  DECIMAL(5,2)   NOT NULL,
    nilai_kuis   DECIMAL(5,2)   NOT NULL,
    nilai_uts    DECIMAL(5,2)   NOT NULL,
    nilai_akhir  DECIMAL(5,2)   NULL,
    grade        VARCHAR(3)     NULL,
    bobot        DECIMAL(4,2)   NULL,
    status_lulus VARCHAR(15)    NULL,
    CONSTRAINT pk_nilai      PRIMARY KEY (id_nilai),
    CONSTRAINT fk_nilai_mhs  FOREIGN KEY (nim)
        REFERENCES mahasiswa(nim)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_nilai_mk   FOREIGN KEY (kode_mk)
        REFERENCES mata_kuliah(kode_mk)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_nilai_grade FOREIGN KEY (grade)
        REFERENCES grade_nilai(grade)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 6. TABEL LOG_REKAP_NILAI
CREATE TABLE IF NOT EXISTS log_rekap_nilai (
    id_log       INT          NOT NULL AUTO_INCREMENT,
    nim          VARCHAR(15)  NOT NULL,
    kode_mk      VARCHAR(10)  NOT NULL,
    nilai_akhir  DECIMAL(5,2) NOT NULL,
    grade        VARCHAR(3)   NOT NULL,
    bobot        DECIMAL(4,2) NOT NULL,
    status_lulus VARCHAR(15)  NOT NULL,
    keterangan   VARCHAR(255) NOT NULL,
    waktu_proses DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_log PRIMARY KEY (id_log)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SELECT 'Database dan semua tabel berhasil dibuat.' AS info;

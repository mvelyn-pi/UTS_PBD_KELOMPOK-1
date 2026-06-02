-- Data Awal Sistem Rekap Nilai Praktikum Mahasiswa

USE uts_pbd_kelompok_01;

-- DATA DOSEN 
INSERT INTO dosen (kode_dosen, nama_dosen, email) VALUES
('D001', 'Abdul Malik, S.Kom., M.Cs.', 'abdulmalik@univmegabuana.ac.id'),
('D002', 'Siti Rahayu, M.Kom.',        'sitirahayu@univmegabuana.ac.id');

INSERT INTO mata_kuliah (kode_mk, nama_mk, sks, semester, kode_dosen) VALUES
('MK001', 'Pemrograman Basis Data',     3, 4, 'D001'),
('MK002', 'Algoritma dan Pemrograman',  3, 2, 'D001'),
('MK003', 'Sistem Basis Data',          3, 3, 'D002');

-- DATA GRADE_NILAI
INSERT INTO grade_nilai (grade, bobot, nilai_bawah, nilai_atas) VALUES
('A',  4.00,  93.00, 100.00),
('A-', 3.75,  85.00,  92.99),
('B+', 3.50,  81.00,  84.99),
('B',  3.25,  75.00,  80.99),
('B-', 3.00,  71.00,  74.99),
('C+', 2.75,  66.00,  70.99),
('C',  2.50,  61.00,  65.99),
('C-', 2.00,  56.00,  60.99),
('D',  1.00,  40.00,  55.99),
('E',  0.00,   0.00,  39.99);

-- DATA MAHASISWA
INSERT INTO mahasiswa (nim, nama, kelas, angkatan) VALUES
('2301001', 'Ahmad Fauzi',          'IF-A', 2023),
('2301002', 'Budi Santoso',         'IF-A', 2023),
('2301003', 'Citra Dewi',           'IF-A', 2023),
('2301004', 'Dian Pratiwi',         'IF-A', 2023),
('2301005', 'Eko Wahyudi',          'IF-A', 2023),
('2301006', 'Fitri Handayani',      'IF-A', 2023),
('2301007', 'Galih Purnama',        'IF-B', 2023),
('2301008', 'Hana Aulia',           'IF-B', 2023),
('2301009', 'Irfan Maulana',        'IF-B', 2023),
('2301010', 'Joko Susilo',          'IF-B', 2023),
('2301011', 'Kartika Sari',         'IF-B', 2023),
('2301012', 'Lutfi Hakim',          'IF-B', 2023),
('2301013', 'Maya Anggraini',       'IF-C', 2023),
('2301014', 'Nanang Kurniawan',     'IF-C', 2023),
('2301015', 'Oktavia Putri',        'IF-C', 2023),
('2301016', 'Putra Ramadhan',       'IF-C', 2023),
('2301017', 'Qori Indah',           'IF-C', 2023),
('2301018', 'Rizky Aditya',         'IF-C', 2023),
('2301019', 'Sinta Lestari',        'IF-D', 2023),
('2301020', 'Taufik Hidayat',       'IF-D', 2023),
('2301021', 'Ulfa Nurhaliza',       'IF-D', 2023),
('2301022', 'Vandi Setiawan',       'IF-D', 2023);

-- DATA NILAI_PRAKTIKUM 
-- nilai_akhir, grade, bobot, status_lulus dikosongkan dulu
-- akan diisi oleh stored procedure
INSERT INTO nilai_praktikum (nim, kode_mk, nilai_tugas, nilai_kuis, nilai_uts) VALUES
-- MK001 - Pemrograman Basis Data (14 mahasiswa)
('2301001', 'MK001',  95.00,  92.00,  96.00),   
('2301002', 'MK001',  88.00,  85.00,  90.00),   
('2301003', 'MK001',  82.00,  80.00,  83.00),   
('2301004', 'MK001',  78.00,  76.00,  79.00),   
('2301005', 'MK001',  73.00,  72.00,  74.00),   
('2301006', 'MK001',  68.00,  67.00,  70.00),   
('2301007', 'MK001',  63.00,  62.00,  65.00),   
('2301008', 'MK001',  58.00,  57.00,  60.00),   
('2301009', 'MK001',  45.00,  50.00,  48.00),   
('2301010', 'MK001',  30.00,  25.00,  35.00),   
('2301011', 'MK001',  84.00,  83.00,  82.00),   
('2301012', 'MK001',  76.00,  74.00,  78.00),   
('2301013', 'MK001',  91.00,  89.00,  93.00),   
('2301014', 'MK001',  55.00,  52.00,  50.00),   

-- MK002 - Algoritma dan Pemrograman 
('2301015', 'MK002',  97.00,  95.00,  98.00),   
('2301016', 'MK002',  86.00,  84.00,  88.00),   
('2301017', 'MK002',  70.00,  69.00,  71.00),   
('2301018', 'MK002',  60.00,  58.00,  62.00),   
('2301019', 'MK002',  38.00,  35.00,  40.00),   

-- MK003 - Sistem Basis Data 
('2301020', 'MK003',  80.00,  78.00,  82.00),   
('2301021', 'MK003',  72.00,  71.00,  73.00),   
('2301022', 'MK003',  65.00,  63.00,  66.00),   
('2301001', 'MK003',  93.00,  94.00,  95.00);   

SELECT 'Data awal berhasil dimasukkan.' AS info;

-- Verifikasi jumlah data
SELECT 'mahasiswa'     AS tabel, COUNT(*) AS jumlah FROM mahasiswa
UNION ALL
SELECT 'dosen',          COUNT(*) FROM dosen
UNION ALL
SELECT 'mata_kuliah',    COUNT(*) FROM mata_kuliah
UNION ALL
SELECT 'grade_nilai',    COUNT(*) FROM grade_nilai
UNION ALL
SELECT 'nilai_praktikum',COUNT(*) FROM nilai_praktikum
UNION ALL
SELECT 'log_rekap_nilai',COUNT(*) FROM log_rekap_nilai;

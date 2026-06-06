-- Data Awal Sistem Rekap Nilai Praktikum Mahasiswa
-- Disesuaikan dengan Absen Logika Informatika 2024/2025
USE uts_pbd_kelompok_01;
-- DATA DOSEN 
INSERT INTO dosen (kode_dosen, nama_dosen, email) VALUES
('D001', 'Muh. Nashir Takbir, S.Kom., M.Pd', 'nashirtakbir@univmegabuana.ac.id'),
('D002', 'Siti Rahayu, M.Kom.',               'sitirahayu@univmegabuana.ac.id');

-- DATA MATA KULIAH
INSERT INTO mata_kuliah (kode_mk, nama_mk, sks, semester, kode_dosen) VALUES
('MK001', 'Logika Informatika',        2, 1, 'D001'),
('MK002', 'Algoritma dan Pemrograman', 3, 2, 'D001'),
('MK003', 'Sistem Basis Data',         3, 3, 'D002');

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

-- DATA MAHASISWA (65 mahasiswa dari absen Logika Informatika Semester I 2024/2025)
INSERT INTO mahasiswa (nim, nama, kelas, angkatan) VALUES
('IK2411001', 'Suharnina Aksan',               'IF-A', 2024),
('IK2411002', 'Elysia Florean A.L',            'IF-A', 2024),
('IK2411003', 'Sri Amaliya',                   'IF-A', 2024),
('IK2411004', 'Futri Natasya',                 'IF-A', 2024),
('IK2411005', 'Dzubyan Fauzan S',              'IF-A', 2024),
('IK2411006', 'Periyanti Rayo',                'IF-A', 2024),
('IK2411007', 'Jaya Rose Bomba O.G',           'IF-A', 2024),
('IK2411008', 'Aulia',                         'IF-A', 2024),
('IK2411009', 'Dinda Adista Putri',            'IF-A', 2024),
('IK2411010', 'Lisa Kelly',                    'IF-A', 2024),
('IK2411011', 'Uminati',                       'IF-A', 2024),
('IK2411012', 'Lilis',                         'IF-A', 2024),
('IK2411013', 'Farida Nur Intan',              'IF-B', 2024),
('IK2411014', 'Nur Aisyah Masdin',             'IF-B', 2024),
('IK2411015', 'Hijryanti',                     'IF-B', 2024),
('IK2411016', 'Winda Anugrah',                 'IF-B', 2024),
('IK2411017', 'Muh. Ridwan',                   'IF-B', 2024),
('IK2411018', 'Fadhila Suardi',                'IF-B', 2024),
('IK2411019', 'Muh. Ardiansyah',               'IF-B', 2024),
('IK2411020', 'Fika Yani Nur',                 'IF-B', 2024),
('IK2411021', 'Ikrimansa',                     'IF-B', 2024),
('IK2411022', 'M. Afrizal Fahrezy',            'IF-B', 2024),
('IK2411023', 'Jeniati. Yl. Sisang',           'IF-B', 2024),
('IK2411024', 'Tiara Nuriani',                 'IF-B', 2024),
('IK2411025', 'Arya Maha Putra',               'IF-B', 2024),
('IK2411026', 'Besse Bella Maharani',          'IF-B', 2024),
('IK2411027', 'Hasbiah',                       'IF-C', 2024),
('IK2411028', 'Mifta Auliya',                  'IF-C', 2024),
('IK2411029', 'Gefran',                        'IF-C', 2024),
('IK2411030', 'Zadly Baan',                    'IF-C', 2024),
('IK2411031', 'Nur Fahila Dwi Irfani Devi',    'IF-C', 2024),
('IK2411032', 'Anandari Dewitri',              'IF-C', 2024),
('IK2411033', 'Ade Fanjaya',                   'IF-C', 2024),
('IK2411034', 'Yusuf Efraim',                  'IF-C', 2024),
('IK2411035', 'Elghiariel Sima Tonga',         'IF-C', 2024),
('IK2411036', 'Ayu Kartika',                   'IF-C', 2024),
('IK2411037', 'Andi Dewa Firdaus',             'IF-C', 2024),
('IK2411038', 'Nur Octavia Kaila Ramadhani',   'IF-C', 2024),
('IK2411039', 'Fauzan Azima',                  'IF-C', 2024),
('IK2411040', 'Hasriani',                      'IF-C', 2024),
('IK2411041', 'Mayfaizha Zulaicha Latuconsina','IF-D', 2024),
('IK2411042', 'Azizah Cahya',                  'IF-D', 2024),
('IK2411043', 'Destrina Sandin Pasalu',        'IF-D', 2024),
('IK2411044', 'Dimas Aprilino',                'IF-D', 2024),
('IK2411045', 'Mersi',                         'IF-D', 2024),
('IK2411046', 'Nur Afni Ishar',                'IF-D', 2024),
('IK2411047', 'Wiwin Saputra',                 'IF-D', 2024),
('IK2411048', 'Sitti Rahma',                   'IF-D', 2024),
('IK2411049', 'Nadya Pratiwi Riswanto',        'IF-D', 2024),
('IK2411050', 'Magfakhrani Nur Fauzia Armin',  'IF-D', 2024),
('IK2411051', 'Arya Saputra',                  'IF-D', 2024),
('IK2411052', 'Muhammad Nur Alam',             'IF-D', 2024),
('IK2411053', 'Sintia',                        'IF-E', 2024),
('IK2411054', 'Muhammad Rizqi Maulana',        'IF-E', 2024),
('IK2411055', 'Ruslan',                        'IF-E', 2024),
('IK2411056', 'Riadarmawangsi',                'IF-E', 2024),
('IK2411057', 'Thizya Tri Frima',              'IF-E', 2024),
('IK2411058', 'Waldina',                       'IF-E', 2024),
('IK2411059', 'Safri Maarif',                  'IF-E', 2024),
('IK2411060', 'Nur Andina',                    'IF-E', 2024),
('IK2411061', 'Muhammad Mahruf',               'IF-E', 2024),
('IK2411062', 'Jack Stiven',                   'IF-E', 2024),
('IK2411063', 'Marsal Rahman',                 'IF-E', 2024),
('IK2411064', 'Tasya',                         'IF-E', 2024),
('IK2411065', 'Salma',                         'IF-E', 2024);

-- DATA NILAI_PRAKTIKUM
-- nilai_akhir, grade, bobot, status_lulus dikosongkan (diisi stored procedure)
INSERT INTO nilai_praktikum (nim, kode_mk, nilai_tugas, nilai_kuis, nilai_uts) VALUES
-- MK001 - Logika Informatika (semua 65 mahasiswa)
('IK2411001', 'MK001',  95.00,  92.00,  96.00),
('IK2411002', 'MK001',  88.00,  85.00,  90.00),
('IK2411003', 'MK001',  82.00,  80.00,  83.00),
('IK2411004', 'MK001',  78.00,  76.00,  79.00),
('IK2411005', 'MK001',  73.00,  72.00,  74.00),
('IK2411006', 'MK001',  68.00,  67.00,  70.00),
('IK2411007', 'MK001',  63.00,  62.00,  65.00),
('IK2411008', 'MK001',  58.00,  57.00,  60.00),
('IK2411009', 'MK001',  45.00,  50.00,  48.00),
('IK2411010', 'MK001',  30.00,  25.00,  35.00),
('IK2411011', 'MK001',  84.00,  83.00,  82.00),
('IK2411012', 'MK001',  76.00,  74.00,  78.00),
('IK2411013', 'MK001',  91.00,  89.00,  93.00),
('IK2411014', 'MK001',  55.00,  52.00,  50.00),
('IK2411015', 'MK001',  86.00,  84.00,  88.00),
('IK2411016', 'MK001',  70.00,  69.00,  71.00),
('IK2411017', 'MK001',  60.00,  58.00,  62.00),
('IK2411018', 'MK001',  80.00,  78.00,  82.00),
('IK2411019', 'MK001',  72.00,  71.00,  73.00),
('IK2411020', 'MK001',  93.00,  94.00,  95.00),
('IK2411021', 'MK001',  65.00,  63.00,  66.00),
('IK2411022', 'MK001',  88.00,  86.00,  87.00),
('IK2411023', 'MK001',  75.00,  74.00,  76.00),
('IK2411024', 'MK001',  83.00,  81.00,  82.00),
('IK2411025', 'MK001',  50.00,  48.00,  52.00),
('IK2411026', 'MK001',  90.00,  88.00,  91.00),
('IK2411027', 'MK001',  77.00,  75.00,  78.00),
('IK2411028', 'MK001',  85.00,  84.00,  86.00),
('IK2411029', 'MK001',  69.00,  67.00,  70.00),
('IK2411030', 'MK001',  82.00,  80.00,  83.00),
('IK2411031', 'MK001',  71.00,  70.00,  72.00),
('IK2411032', 'MK001',  87.00,  85.00,  88.00),
('IK2411033', 'MK001',  74.00,  73.00,  75.00),
('IK2411034', 'MK001',  42.00,  40.00,  44.00),
('IK2411035', 'MK001',  79.00,  77.00,  80.00),
('IK2411036', 'MK001',  81.00,  79.00,  82.00),
('IK2411037', 'MK001',  76.00,  74.00,  77.00),
('IK2411038', 'MK001',  84.00,  82.00,  85.00),
('IK2411039', 'MK001',  92.00,  90.00,  93.00),
('IK2411040', 'MK001',  78.00,  76.00,  79.00),
('IK2411041', 'MK001',  83.00,  81.00,  84.00),
('IK2411042', 'MK001',  77.00,  75.00,  78.00),
('IK2411043', 'MK001',  86.00,  84.00,  87.00),
('IK2411044', 'MK001',  68.00,  66.00,  69.00),
('IK2411045', 'MK001',  80.00,  78.00,  81.00),
('IK2411046', 'MK001',  73.00,  71.00,  74.00),
('IK2411047', 'MK001',  55.00,  53.00,  57.00),
('IK2411048', 'MK001',  89.00,  87.00,  90.00),
('IK2411049', 'MK001',  82.00,  80.00,  83.00),
('IK2411050', 'MK001',  85.00,  83.00,  86.00),
('IK2411051', 'MK001',  91.00,  89.00,  92.00),
('IK2411052', 'MK001',  76.00,  74.00,  77.00),
('IK2411053', 'MK001',  79.00,  77.00,  80.00),
('IK2411054', 'MK001',  72.00,  70.00,  73.00),
('IK2411055', 'MK001',  88.00,  86.00,  89.00),
('IK2411056', 'MK001',  84.00,  82.00,  85.00),
('IK2411057', 'MK001',  70.00,  68.00,  71.00),
('IK2411058', 'MK001',  35.00,  30.00,  32.00),
('IK2411059', 'MK001',  48.00,  45.00,  50.00),
('IK2411060', 'MK001',  81.00,  79.00,  82.00),
('IK2411061', 'MK001',  75.00,  73.00,  76.00),
('IK2411062', 'MK001',  78.00,  76.00,  79.00),
('IK2411063', 'MK001',  20.00,  18.00,  22.00),
('IK2411064', 'MK001',  60.00,  58.00,  62.00),
('IK2411065', 'MK001',  58.00,  56.00,  60.00),

-- MK002 - Algoritma dan Pemrograman (sebagian mahasiswa)
('IK2411001', 'MK002',  97.00,  95.00,  98.00),
('IK2411002', 'MK002',  86.00,  84.00,  88.00),
('IK2411003', 'MK002',  70.00,  69.00,  71.00),
('IK2411004', 'MK002',  60.00,  58.00,  62.00),
('IK2411005', 'MK002',  38.00,  35.00,  40.00),

-- MK003 - Sistem Basis Data (sebagian mahasiswa)
('IK2411006', 'MK003',  80.00,  78.00,  82.00),
('IK2411007', 'MK003',  72.00,  71.00,  73.00),
('IK2411008', 'MK003',  65.00,  63.00,  66.00),
('IK2411001', 'MK003',  93.00,  94.00,  95.00);

SELECT 'Data awal berhasil dimasukkan.' AS info;

-- Verifikasi jumlah data
SELECT 'mahasiswa'      AS tabel, COUNT(*) AS jumlah FROM mahasiswa
UNION ALL
SELECT 'dosen',           COUNT(*) FROM dosen
UNION ALL
SELECT 'mata_kuliah',     COUNT(*) FROM mata_kuliah
UNION ALL
SELECT 'grade_nilai',     COUNT(*) FROM grade_nilai
UNION ALL
SELECT 'nilai_praktikum', COUNT(*) FROM nilai_praktikum
UNION ALL
SELECT 'log_rekap_nilai', COUNT(*) FROM log_rekap_nilai;
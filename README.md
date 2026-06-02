# Sistem Rekap Nilai Praktikum Mahasiswa
## UTS Pemrograman Basis Data – Kelompok 01

---

## 👥 Nama Kelompok & Anggota

| No | Nama | NIM | Tanggung Jawab |
|----|------|-----|----------------|
| 1  | [Nama Anggota 1] | [NIM] | Database, tabel, relasi, data awal |
| 2  | [Nama Anggota 2] | [NIM] | Perhitungan nilai akhir (variabel) |
| 3  | [Nama Anggota 3] | [NIM] | Percabangan grade, bobot, status, perulangan |
| 4  | [Nama Anggota 4] | [NIM] | Implicit cursor, explicit cursor, cursor parameter |

---

## 📋 Deskripsi Sistem

Sistem Rekap Nilai Praktikum Mahasiswa adalah sistem database berbasis MySQL yang membantu dosen mengelola dan menghitung nilai praktikum mahasiswa secara otomatis.

Sistem ini mampu:
- Menyimpan data mahasiswa, dosen, dan mata kuliah
- Menghitung nilai akhir menggunakan rumus berbobot
- Menentukan grade, bobot SKS, dan status kelulusan
- Mencatat riwayat proses rekap ke tabel log

---

## 🗄️ Struktur Tabel

| Tabel | Fungsi | Primary Key |
|-------|--------|-------------|
| `mahasiswa` | Data mahasiswa | `nim` |
| `dosen` | Data dosen pengampu | `kode_dosen` |
| `mata_kuliah` | Data mata kuliah | `kode_mk` |
| `grade_nilai` | Standar grade & bobot | `grade` |
| `nilai_praktikum` | Nilai mahasiswa per MK | `id_nilai` |
| `log_rekap_nilai` | Riwayat proses rekap | `id_log` |

---

## ▶️ Cara Menjalankan Program

### Prasyarat
- XAMPP sudah terinstall dan MySQL/Apache aktif
- Buka phpMyAdmin di browser: `http://localhost/phpmyadmin`

### Langkah-langkah

1. **Buat Database & Tabel**
   - Buka tab **SQL** di phpMyAdmin
   - Salin isi `database.sql` → klik **Go**

2. **Masukkan Data Awal**
   - Salin isi `data_awal.sql` → klik **Go**

3. **Buat Stored Procedure**
   - Salin isi `procedure_rekap_nilai.sql` → klik **Go**

4. **Jalankan Pengujian**
   - Salin isi `query_pengujian.sql` → klik **Go**

---

## 📦 Daftar Stored Procedure

| Procedure | Parameter | Fungsi |
|-----------|-----------|--------|
| `rekap_semua_nilai()` | – | Merekap seluruh nilai mahasiswa dari semua mata kuliah |
| `rekap_nilai_per_mk(p_kode_mk)` | `p_kode_mk VARCHAR(10)` | Merekap nilai mahasiswa pada satu mata kuliah tertentu |

### Contoh Pemanggilan
```sql
-- Rekap semua nilai
CALL rekap_semua_nilai();

-- Rekap per mata kuliah
CALL rekap_nilai_per_mk('MK001');
CALL rekap_nilai_per_mk('MK002');
CALL rekap_nilai_per_mk('MK003');
```

---

## 📐 Rumus Nilai Akhir

```
nilai_akhir = (nilai_tugas × 30%) + (nilai_kuis × 30%) + (nilai_uts × 40%)
```

## 📊 Ketentuan Grade

| Grade | Bobot | Nilai Bawah | Nilai Atas | Status |
|-------|-------|-------------|------------|--------|
| A     | 4.00  | 93.00       | 100.00     | LULUS |
| A-    | 3.75  | 85.00       | 92.99      | LULUS |
| B+    | 3.50  | 81.00       | 84.99      | LULUS |
| B     | 3.25  | 75.00       | 80.99      | LULUS |
| B-    | 3.00  | 71.00       | 74.99      | LULUS |
| C+    | 2.75  | 66.00       | 70.99      | LULUS |
| C     | 2.50  | 61.00       | 65.99      | LULUS |
| C-    | 2.00  | 56.00       | 60.99      | TIDAK LULUS |
| D     | 1.00  | 40.00       | 55.99      | TIDAK LULUS |
| E     | 0.00  | 0.00        | 39.99      | TIDAK LULUS |

---

## 📂 Struktur File Repository

```
UTS_PBD_Kelompok_03/
├── database.sql              # DDL: database, tabel, relasi
├── data_awal.sql             # DML: insert data awal
├── procedure_rekap_nilai.sql # Stored procedure rekap nilai
├── query_pengujian.sql       # Query pengujian & verifikasi
├── laporan_uts.pdf           # Laporan projek PDF
└── README.md                 # Dokumentasi ini
```

---

## 🔧 Konsep Pemrograman Basis Data yang Digunakan

- **Variabel Lokal** – Menyimpan nilai sementara dalam procedure
- **Percabangan** – `CASE` untuk grade, `IF` untuk status kelulusan
- **Perulangan** – `LOOP` untuk iterasi setiap baris data
- **Implicit Cursor** – `ROW_COUNT()` menghitung baris yang diperbarui
- **Explicit Cursor** – `DECLARE CURSOR` membaca data nilai_praktikum
- **Cursor dengan Parameter** – Parameter procedure digunakan sebagai filter cursor

---

*Program Studi S1 Informatika – Universitas Mega Buana Palopo – 2026*

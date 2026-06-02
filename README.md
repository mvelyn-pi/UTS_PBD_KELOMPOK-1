# Sistem Rekap Nilai Praktikum Mahasiswa
## UTS Pemrograman Basis Data – Kelompok 03

---

## 👥 Nama Kelompok & Anggota

| No | Nama | NIM | Tanggung Jawab |
|----|------|-----|----------------|
| 1  | MUHAMMAD NUR ALAM | [NIM] | Database, tabel, relasi, dan data awal |
| 2  | MUH.ARDIANSYAH | [NIM] | Stored procedure `rekap_semua_nilai()` + penjelasan query pengujian bagian A & B |
| 3  | ANDI DEWA FIRDAUS | [NIM] | Stored procedure `rekap_nilai_per_mk()` + penjelasan query pengujian bagian C & D |
| 4  | M. AFRIZAL FAHREZY | [NIM] | Dokumentasi, laporan PDF, dan README GitHub |

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

1. **Buat Database & Tabel** *(Anggota 1)*
   - Buka tab **SQL** di phpMyAdmin
   - Salin isi `database.sql` → klik **Go**

2. **Masukkan Data Awal** *(Anggota 1)*
   - Salin isi `data_awal.sql` → klik **Go**

3. **Buat Stored Procedure** *(Anggota 2 & 3)*
   - Salin isi `procedure_rekap_nilai.sql` → klik **Go**

4. **Jalankan Pengujian** *(Anggota 2 & 3)*
   - Salin isi `query_pengujian.sql` → klik **Go**

---

## 📦 Daftar Stored Procedure

| Procedure | Dikerjakan | Parameter | Fungsi |
|-----------|------------|-----------|--------|
| `rekap_semua_nilai()` | Anggota 2 | – | Merekap seluruh nilai mahasiswa dari semua mata kuliah menggunakan explicit cursor |
| `rekap_nilai_per_mk(p_kode_mk)` | Anggota 3 | `p_kode_mk VARCHAR(10)` | Merekap nilai mahasiswa pada satu mata kuliah tertentu menggunakan cursor dengan parameter |

### Contoh Pemanggilan
```sql
-- Rekap semua nilai (Anggota 2)
CALL rekap_semua_nilai();

-- Rekap per mata kuliah (Anggota 3)
CALL rekap_nilai_per_mk('MK001');
CALL rekap_nilai_per_mk('MK002');
CALL rekap_nilai_per_mk('MK003');
```

---

## 📂 Pembagian File per Anggota

| File | Dikerjakan Oleh |
|------|----------------|
| `database.sql` | Anggota 1 |
| `data_awal.sql` | Anggota 1 |
| `procedure_rekap_nilai.sql` → `rekap_semua_nilai()` | Anggota 2 |
| `query_pengujian.sql` → bagian A & B | Anggota 2 |
| `procedure_rekap_nilai.sql` → `rekap_nilai_per_mk()` | Anggota 3 |
| `query_pengujian.sql` → bagian C & D | Anggota 3 |
| `README.md` | Anggota 4 |
| `laporan_uts.pdf` | Anggota 4 |

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
├── database.sql              # DDL: database, tabel, relasi (Anggota 1)
├── data_awal.sql             # DML: insert data awal (Anggota 1)
├── procedure_rekap_nilai.sql # Stored procedure rekap nilai (Anggota 2 & 3)
├── query_pengujian.sql       # Query pengujian & verifikasi (Anggota 2 & 3)
├── laporan_uts.pdf           # Laporan projek PDF (Anggota 4)
└── README.md                 # Dokumentasi ini (Anggota 4)
```

---

## 🔧 Konsep Pemrograman Basis Data yang Digunakan

| Konsep | Digunakan Di | Dikerjakan Oleh |
|--------|-------------|----------------|
| **Variabel Lokal** | `rekap_semua_nilai()` | Anggota 2 |
| **Percabangan** (`CASE` & `IF`) | `rekap_semua_nilai()` | Anggota 2 |
| **Perulangan** (`LOOP`) | `rekap_semua_nilai()` | Anggota 2 |
| **Implicit Cursor** (`ROW_COUNT()`) | `rekap_semua_nilai()` | Anggota 2 |
| **Explicit Cursor** (`DECLARE CURSOR`) | `rekap_semua_nilai()` | Anggota 2 |
| **Cursor dengan Parameter** | `rekap_nilai_per_mk()` | Anggota 3 |

---

*Program Studi S1 Informatika – Universitas Mega Buana Palopo – 2026*
# Sistem Rekap Nilai Praktikum Mahasiswa
## UTS Pemrograman Basis Data – Kelompok 01

---

## 👥 Nama Kelompok & Anggota

| No | Nama | NIM | Tanggung Jawab |
|----|------|-----|----------------|
| 1  | MUHAMMAD NUR ALAM | IK2411052 | Membuat database, tabel, relasi, dan data awal |
| 2  | M. AFRIZAL FAHREZY | IK2411022 | Membuat perhitungan nilai akhir menggunakan variabel |
| 3  | ANDI DEWA FIRDAUS | IK2411037 | Membuat percabangan grade, bobot, status kelulusan, dan perulangan |
| 4  | MUH. ARDIANSYAH | IK2411019 | Membuat implicit cursor, explicit cursor, cursor dengan parameter, log rekap, dan laporan |

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

1. **Buat Database & Tabel** *(MUHAMMAD NUR ALAM)*
   - Buka tab **SQL** di phpMyAdmin
   - Salin isi `sql/database.sql` → klik **Go**

2. **Masukkan Data Awal** *(MUHAMMAD NUR ALAM)*
   - Salin isi `sql/data_awal.sql` → klik **Go**

3. **Buat Stored Procedure** *(M. AFRIZAL FAHREZY, ANDI DEWA FIRDAUS & MUH. ARDIANSYAH)*
   - Salin isi `sql/procedure_rekap_nilai.sql` → klik **Go**

4. **Jalankan Pengujian** *(M. AFRIZAL FAHREZY, ANDI DEWA FIRDAUS & MUH. ARDIANSYAH)*
   - Salin isi `sql/query_pengujian.sql` → klik **Go**

---

## 📦 Daftar Stored Procedure

| Procedure | Dikerjakan | Parameter | Fungsi |
|-----------|------------|-----------|--------|
| `rekap_semua_nilai()` | M. AFRIZAL FAHREZY & ANDI DEWA FIRDAUS | – | Merekap seluruh nilai mahasiswa dari semua mata kuliah menggunakan explicit cursor |
| `rekap_nilai_per_mk(p_kode_mk)` | MUH. ARDIANSYAH | `p_kode_mk VARCHAR(10)` | Merekap nilai mahasiswa pada satu mata kuliah tertentu menggunakan cursor dengan parameter |

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

## 📂 Pembagian File per Anggota

| File | Dikerjakan Oleh |
|------|----------------|
| `sql/database.sql` | MUHAMMAD NUR ALAM (IK241152) |
| `sql/data_awal.sql` | MUHAMMAD NUR ALAM (IK241152) |
| `sql/procedure_rekap_nilai.sql` → variabel & rumus nilai akhir | M. AFRIZAL FAHREZY (IK2411022) |
| `sql/procedure_rekap_nilai.sql` → percabangan & perulangan | ANDI DEWA FIRDAUS (IK2411037) |
| `sql/procedure_rekap_nilai.sql` → implicit cursor, explicit cursor, cursor parameter, log | MUH. ARDIANSYAH (IK2411019) |
| `sql/query_pengujian.sql` | M. AFRIZAL FAHREZY, ANDI DEWA FIRDAUS & MUH. ARDIANSYAH |
| `laporan/laporan_uts.pdf` | MUH. ARDIANSYAH (IK2411019) |
| `README.md` | MUH. ARDIANSYAH (IK2411019) |

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
UTS_PBD_Kelompok_01/
├── sql/
│   ├── database.sql              # DDL: database, tabel, relasi (MUHAMMAD NUR ALAM)
│   ├── data_awal.sql             # DML: insert data awal (MUHAMMAD NUR ALAM)
│   ├── procedure_rekap_nilai.sql # Stored procedure rekap nilai (AFRIZAL, ANDI DEWA & ARDIANSYAH)
│   └── query_pengujian.sql       # Query pengujian & verifikasi (AFRIZAL, ANDI DEWA & ARDIANSYAH)
├── laporan/
│   └── laporan_uts.pdf           # Laporan projek PDF (MUH. ARDIANSYAH)
└── README.md                     # Dokumentasi ini (MUH. ARDIANSYAH)
```

---

## 🔧 Konsep Pemrograman Basis Data yang Digunakan

| Konsep | Digunakan Di | Dikerjakan Oleh |
|--------|-------------|----------------|
| **Variabel Lokal** | `rekap_semua_nilai()` | M. AFRIZAL FAHREZY |
| **Percabangan** (`CASE` & `IF`) | `rekap_semua_nilai()` | ANDI DEWA FIRDAUS |
| **Perulangan** (`LOOP`) | `rekap_semua_nilai()` | ANDI DEWA FIRDAUS |
| **Implicit Cursor** (`ROW_COUNT()`) | `rekap_semua_nilai()` | MUH. ARDIANSYAH |
| **Explicit Cursor** (`DECLARE CURSOR`) | `rekap_semua_nilai()` | MUH. ARDIANSYAH |
| **Cursor dengan Parameter** | `rekap_nilai_per_mk()` | MUH. ARDIANSYAH |

---

*Program Studi S1 Informatika – Universitas Mega Buana Palopo – 2026*

---

## 📸 Screenshot Hasil Program

### 1. Data Awal — Proses Insert ke Database
![Data Awal 1](laporan/screenshot/data_awal_1.png)

### 2. Verifikasi Jumlah Data Awal per Tabel
![Data Awal 2](laporan/screenshot/data_awal_2.png)

> Mahasiswa: 65 | Dosen: 2 | Mata Kuliah: 3 | Grade Nilai: 10 | Nilai Praktikum: 74 | Log Rekap Nilai: 0 (kosong)

### 3. Hasil Eksekusi Procedure — Pembuatan Stored Procedure
![Hasil Eksekusi Procedure 1](laporan/screenshot/hasil_eksekusi_procedure_1.png)

### 4. Hasil Eksekusi Procedure — Konfirmasi Stored Procedure Berhasil Dibuat
![Hasil Eksekusi Procedure 2](laporan/screenshot/hasil_eksekusi_procedure_2.png)

> Output: *"Semua stored procedure berhasil dibuat."*

### 5. Tabel nilai_praktikum Sebelum Procedure Dijalankan
![Tabel Nilai Praktikum](laporan/screenshot/tabel_nilai_praktikum.png)

> Kolom `nilai_akhir`, `grade`, `bobot`, dan `status_lulus` masih bernilai NULL sebelum procedure dijalankan.

### 6. Tabel log_rekap_nilai Setelah Procedure Dijalankan
![Log Rekap Nilai](laporan/screenshot/log_rekap_nilai.png)

> Tabel log terisi otomatis setelah `CALL rekap_semua_nilai()` dijalankan, mencatat seluruh riwayat proses rekap nilai beserta waktu prosesnya.
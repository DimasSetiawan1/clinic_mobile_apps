# Clinic Apps

Aplikasi manajemen klinik cross‑platform (iOS, Android & Web) yang memudahkan alur kerja dokter, perawat, resepsionis, dan pasien—dibangun dengan Flutter di front‑end dan Laravel di back‑end.

---

## 📋 Daftar Isi

- [📖 Deskripsi](#-deskripsi)  
- [⚙️ Fitur Utama](#️-fitur-utama)  
- [🛠️ Teknologi](#️-teknologi)  
- [🚀 Instalasi & Menjalankan](#-instalasi--menjalankan)  
- [📂 Struktur Proyek](#-struktur-proyek)  
- [👨‍💻 Cara Penggunaan](#-cara-penggunaan)  
- [🤝 Kontribusi](#-kontribusi)  
- [📝 Lisensi](#-lisensi)  

---

## 📖 Deskripsi

**Clinic Apps** adalah platform manajemen klinik modern yang memungkinkan:  
- **Pasien** mendaftar dan booking janji temu secara online, melihat riwayat medis dan pembayaran.  
- **Dokter & Perawat** merekam diagnosa, resep, hasil lab, dan grafik perkembangan pasien.  
- **Resepsionis/Admin** mengatur jadwal, mengelola data pasien, memantau laporan operasional dan keuangan.  

---

## ⚙️ Fitur Utama

- **Autentikasi Multi‑Role**  
  - Registrasi & login untuk Admin, Dokter, Perawat, Pasien  
- **Manajemen Pasien**  
  - CRUD data, unggah dokumen, rekam medis lengkap  
- **Jadwal & Booking**  
  - Kalender appointment, notifikasi push & email  
- **Rekam Medis & Resep**  
  - Form diagnosa, resep obat, hasil lab, grafik perkembangan  
- **Pembayaran & Invoice**  
  - Integrasi Midtrans/Stripe, riwayat transaksi  
- **Dashboard & Laporan**  
  - Statistik pasien, omzet, jenis kunjungan  
- **Chat In‑App**  
  - Komunikasi real‑time dokter‑pasien  

---

## 🛠️ Teknologi

| Layer        | Teknologi & Library                            |
| ------------ | ----------------------------------------------- |
| **Front‑end**| Flutter (Dart), Provider/Riverpod, Dio, Hive    |
| **Back‑end** | Laravel 9+, PHP 8+, Sanctum/Passport, Eloquent |
| **Database** | MySQL / PostgreSQL                             |
| **DevOps**   | Docker, GitHub Actions, PM2 (opsional)         |

---

## 🚀 Instalasi & Menjalankan

### Prasyarat

- Flutter SDK  
- PHP 8+, Composer  
- MySQL / PostgreSQL  
- Node.js & npm (untuk web admin, jika ada)  

### Langkah Setup Back‑end (Laravel)

```bash
git clone https://github.com/username/clinic-apps.git](https://github.com/DimasSetiawan1/laravel-clinic-backend.git
cd laravel-clinic-backend

# Install dependencies
composer install
cp .env.example .env
php artisan key:generate

# Konfigurasi .env: sesuaikan DB_*, MAIL_*, dan SANCTUM_*
php artisan migrate --seed

# Jalankan server
php artisan serve

Langkah Setup Front‑end (Flutter)

git clone https://github.com/DimasSetiawan1/clinic_mobile_apps.git
cd clinic_mobile_apps
flutter pub get
flutter run

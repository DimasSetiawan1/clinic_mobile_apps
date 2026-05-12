# Clinic Apps

Aplikasi manajemen klinik cross‑platform (iOS, Android & Web) yang memudahkan alur kerja dokter, perawat, resepsionis, dan pasien—dibangun dengan Flutter di front‑end dan Laravel di back‑end.

---
## Screenshoot UI
Berikut adalah tampilan antarmuka dari Clinic Apps:
<p align="center">
  <img src="https://github.com/user-attachments/assets/4426bb8c-c08b-4dc9-977f-0ab524a28548" width="230" alt="Dashboard" />
  <img src="https://github.com/user-attachments/assets/4d5b56c5-861a-4261-aa17-46034c45faf8" width="230" alt="Chat" />
  <img src="https://github.com/user-attachments/assets/83510885-9c37-4914-b509-59aa3be1dda2" width="230" alt="Telemedis" />
  <img src="https://github.com/user-attachments/assets/091dff87-24d1-4f01-9e5d-c5fd0726826f" width="230" alt="Profile" />
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/c223dd3f-3041-4365-bf22-6c63d7dc9a15" width="230" alt="Login" />
  <img src="https://github.com/user-attachments/assets/df8d638e-6c56-4c47-85b9-211579ce3c19" width="230" alt="Detail Dokter" />
  <img src="https://github.com/user-attachments/assets/4f73e47d-9aeb-4dbb-a8d9-1441ed9e1247" width="230" alt="Konfirmasi" />
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/ca4711c6-9558-4e32-8489-4332a0239dee" width="230" alt="Pembayaran" />
  <img src="https://github.com/user-attachments/assets/48fda148-5a63-4f5d-8192-074f08279a72" width="230" alt="Xendit" />
  <img src="https://github.com/user-attachments/assets/ae2c5d4c-a135-4415-a140-ca7441e90b98" width="230" alt="Success" />
</p>



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

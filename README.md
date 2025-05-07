# LAPORAN UTS PEMROGRAMAN BERBASIS MOBILE
# flutter_uts_aplikasi_jadwal_kuliah_dan_kegiatan_mahasiswa_adapatif_interaktif
# Nama / NPM  
Siti Intan Nia / 4522210054
# Penjelasan Singkat Aplikasi
Aplikasi ini merupakan aplikasi Flutter yang responsif dan adaptif, dirancang untuk menyajikan informasi penting bagi mahasiswa. Terdiri dari tiga halaman utama—Beranda, Jadwal Kuliah, dan Profil Pengguna—tampilan aplikasi secara otomatis menyesuaikan dengan ukuran layar perangkat. Fitur-fitur utamanya mencakup pengelolaan daftar kegiatan, opsi untuk beralih antara mode gelap dan terang, serta kemampuan untuk memperbarui informasi pengguna
# Screenshot Emulator
# Tampilan Akun
![image](https://github.com/user-attachments/assets/473b1f16-7713-4905-afe9-b4615383c4a6)

# Tampilan Jadwal
![image](https://github.com/user-attachments/assets/deea77f1-03c2-4899-9eda-0a6d7250bdcc)

# Tampilan Home
![image](https://github.com/user-attachments/assets/990e23cb-a07a-43cd-aa1f-4d2cd3d1609b)

# Penjelasan Program
- Navigasi Responsif (Adaptive Layout) <br>
  Aplikasi ini menggunakan paket flutter_adaptive_scaffold untuk memberikan pengalaman pengguna yang optimal di berbagai ukuran layar: <br>
  Layar kecil (mobile): menggunakan BottomNavigationBar <br>
  Layar besar (tablet & desktop): menggunakan NavigationRail di sisi kiri <br>

- Halaman Home (Beranda)
  Menampilkan daftar kegiatan mahasiswa dalam bentuk kartu. <br>
  Setiap kartu berisi nama kegiatan, tanggal, dan checkbox untuk menandai apakah kegiatan telah selesai.<br>
  Pengguna dapat menambahkan kegiatan baru dengan tombol FloatingActionButton. Form input akan muncul dalam dialog pop-up.<br>
  Setiap kegiatan juga dapat dihapus melalui ikon tempat sampah.<br>
  Di bagian atas, ditampilkan kutipan motivasi harian berdasarkan hari dalam seminggu.<br>
  Tersedia tombol navigasi langsung ke halaman Jadwal dan Profil.<br>

- Halaman Jadwal
  Menampilkan jadwal kuliah dalam bentuk kartu.<br>
  Setiap item menampilkan hari, nama mata kuliah, dan jam kuliah.<br>

- Halaman Profil Mahasiswa
  Menampilkan foto profil, nama lengkap, NPM, email, dan jurusan dalam satu kartu.<br>
  Tersedia ikon edit untuk memperbarui setiap informasi secara langsung via dialog input.<br>
  Terdapat switch untuk mengaktifkan Mode Gelap (dark mode).<br>
  Terdapat tombol Logout di bagian bawah.<br>
    
# Link YouTube Presentasi
https://youtu.be/HTLeCkgiAlQ?si=FhIbS92UpshCFjK-

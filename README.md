### Tugas 7

1. Jelaskan apa yang dimaksud dengan widget tree pada Flutter dan bagaimana hubungan induk-anak (parent-child) bekerja antar-widget!

  Widget tree adalah struktur hierarkis di Flutter yang menggambarkan bagaimana widget-widget disusun dan saling terikat untuk membentuk tampilan antarmuka aplikasi. Hubungan parent-child disini bekerja dengan cara widget parent membungkus serta mengatur tata letak widget anak di dalamnya melalui properti seperti child atau children. Melalui struktur ini, widget induk dapat mewariskan sifat, ukuran, serta batasan tata letak kepada widget-widget child yang ada di bawahnya.

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!

  **MaterialApp** 
  Berfungsi sebagai pengatur inti aplikasi berbasis Material Design, yang mengonfigurasi tema global, judul, serta halaman awal aplikasi.

  **Scaffold** 
  Menyediakan kerangka dasar tata letak visual halaman (seperti penyediaan AppBar di bagian atas dan body untuk isi konten utama).

  **AppBar** 
  Menampilkan bar navigasi atau header di bagian atas layar lengkap dengan judul dan warna tema.

  **SingleChildScrollView**
  Membuat konten di dalam layar dapat digulir (scrolled) secara vertikal untuk mencegah terjadinya error luapan piksel (overflow).

  **Padding**
  Memberikan jarak atau ruang kosong (margin internal) di sekeliling widget anak agar tidak menepi langsung ke batas layar.

  **Column & Row**
  Column berfungsi menyusun widget anak secara vertikal (atas ke bawah), sedangkan Row menyusun widget anak secara horizontal (kiri ke kanan).

  **Center**
  Berfungsi untuk menengahkan widget anak di dalamnya secara horizontal dan vertikal terhadap ruang yang tersedia.

  **SizedBox**
  Memberikan jarak kosong dengan ukuran tetap (fixed spacing) yang spesifik antara satu widget dengan widget lainnya.

  **InfoCard & ItemCard**
  Widget kustom buatan sendiri untuk menampilkan kartu informasi data diri serta tombol menu interaktif secara modular.

  **GridView.count**
  Menyusun daftar item menu dalam bentuk tata letak kisi (grid) dengan jumlah kolom tetap secara rapi.

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini umumnya digunakan sebagai root widget pada aplikasi Flutter!

  Widget ini berfungsi sebagai pengatur utama aplikasi yang menerapkan standar desain Google (Material Design). Di dalamnya, MaterialApp mengkonfigurasi berbagai elemen utama seperti tema warna global, judul aplikasi, halaman awal (home), serta sistem navigasi untuk berpindah antarhalaman.

  **Alasan digunakan sebagai Root Widget**
  Widget ini biasanya diletakkan sebagai root dari widget tree agar seluruh komponen atau halaman turunannya dapat mengakses konfigurasi, tema, dan navigasi secara konsisten. Tanpa MaterialApp di root, widget-widget standar Flutter tidak akan memiliki fondasi dasar yang diperlukan untuk merender tampilannya dengan benar.

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget! Kapan kita sebaiknya memilih StatelessWidget dan kapan harus menggunakan StatefulWidget?

  StatelessWidget adalah widget yang bersifat statis atau immutable, artinya tampilannya tidak akan berubah setelah dirender karena tidak memiliki data internal (state). Sebaliknya, StatefulWidget adalah widget yang bersifat dinamis karena memiliki state terpisah yang dapat diperbarui sewaktu-waktu, sehingga bisa mengubah tampilan antarmuka secara otomatis lewat fungsi setState().

  **Kapan memilih masing-masing widget**
  Kita sebaiknya memilih StatelessWidget ketika membuat komponen yang sifatnya tetap dan tidak membutuhkan interaksi yang mengubah data internal (seperti teks statis, icon, atau kartu identitas). Di sisi lain, kita harus menggunakan StatefulWidget saat membangun komponen yang interaktif atau mengalami perubahan data secara berkala (seperti formulir input, tombol counter, animasi, atau status loading).

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode build?

  BuildContext adalah objek yang merepresentasikan lokasi sebuah widget di dalam struktur widget tree. Objek ini sangat penting karena memungkinkan sebuah widget mengetahui posisinya serta mengakses informasi global atau fitur dari widget-widget terdahulu (parent), seperti tema warna, media query, dan sistem navigasi.

  Dalam penggunaannya, parameter context selalu diterima di dalam metode build(BuildContext context). Parameter ini kemudian diteruskan ke fungsi bawaan seperti Theme.of(context) untuk mengambil gaya tema, atau digunakan saat melakukan navigasi dan menampilkan SnackBar.


6. Jelaskan konsep hot reload di Flutter dan apa perbedaannya dengan hot restart! Kapan kita tidak bisa hanya mengandalkan hot reload dan harus melakukan   hot restart atau full restart?
  
  Hot reload bekerja dengan cara menyisupkan perubahan kode yang baru saja diperbarui ke dalam Dart Virtual Machine yang sedang berjalan tanpa menghilangkan status aplikasi saat ini, sehingga reloadnya sangat cepat. Sebaliknya, hot restart memuat ulang seluruh aplikasi dari titik awal (main()), yang berarti seluruh status atau state aplikasi akan terhapus dan dimuat kembali dari kondisi awal.

  **Kapan digunakan**
  Kita tidak bisa selalu mengandalkan hot reload. Hot reload bisa digunakan jika kita menyisip atau mengubah kode tanpa mengganggu struktur utamanya, tetapi kita wajib melakukan hot restart atau full restart jika kita melakukan perubahan struktural tertentu seperti memodifikasi fungsi main(), mengubah nilai variabel global, menambah aset baru seperti gambar atau font, dan maupun mengubah inisialisasi awal aplikasi yang tidak dapat dibaca ulang oleh mesin virtual secara instan. Full restart sebenarnya dipakai jika terjadi perubahan kode native (seperti konfigurasi Android atau penambahan dependencies baru) yang tidak dapat ditangani oleh hot reload maupun hot restart.

### AI Disclosure 

1. Tools AI yang Digunakan

* **Generative AI Tool:** Gemini 
* **Penggunaan Utama:**  Membantu memahami tugas dan materi, memeriksa kode Flutter, menjelaskan penyebab serta letak error, dan membantu menyusun unit
test.

2. Strategi Prompting

* **Context-First Prompting:** Memberikan konteks dari tugas agar bisa memahami tujuang yang ingin dicapai
* **Constraint-Based Prompting:** Memberikan batasan scope yang dikerjakan sesuai dengan checklist minimal yang diinginkan soal
* **Verify before execute:**  Meminta penjelasan penyebab error sebelum melakukan perbaikan, serta memeriksa kembali hasilnya melalui aplikasi
  dan perintah pemeriksaan Flutter.

3. Analisis Kritis Keterbatasan AI & Perbaikan Manual

* **Tata Letak Belum Teruji pada Ukuran Layar Berbeda:** Pemeriksaan awal AI berfokus pada kesesuaian kode dengan checklist dan belum menjalankan
  aplikasi. Ketika aplikasi dibuka pada browser lebar, ukuran kartu membesar dan muncul pesan bottom overflow.
  **Perbaikan Manual:** Membungkus isi halaman menggunakan `SingleChildScrollView` dan membatasi tinggi kartu melalui `mainAxisExtent`
  pada `GridView.count`.

* **Kesalahan Penempatan Kurung saat Mengubah Widget Tree:** Saat menambahkan widget pembungkus, penutup daftar `children` pada `Column` utama sempat
  terlewat sehingga kode memiliki syntax error.
  **Perbaikan Manual:** Memeriksa kembali pasangan kurung dan susunan widget, lalu memperbaiki penutup `children`, `Column`,
  `Padding`, dan `SingleChildScrollView`.

* **Tes Bawaan Tidak Sesuai dengan Aplikasi:** Tes bawaan Flutter masih mencari angka counter `0`, sedangkan aplikasi sudah menampilkan halaman
  portofolio.
  **Perbaikan Manual:** Melakukan penyesuaian pada unit test agar memeriksa kartu identitas, tiga menu, dan pesan SnackBar sesuai fungsi aplikasi saat ini lalu diuji melalui perintah fultter test

4. Log / Bukti Prompting

> *Daftar ringkasan prompt/interaksi utama dengan AI:*
> - **Pengguna:** *"Setelah menambahkan SingleChildScrollView, apakah susunan kurung pada widget tree yang saya perbaiki sudah benar?"*
> - **Pengguna:** *"Mengapa muncul garis kuning-hitam dengan pesan bottom overflow pada halaman Flutter, coba jelaskan apa penyebabnya dan apa langkah     langkah mengatasinya?"*
> - **Pengguna:** *"Mengapa flutter test masih mencari teks 0 padahal aplikasi saya sudah berupa halaman portofolio, jelaskan apa maksud dan penyebabnya lalu berikan carfa untuk mengatasinya?"*
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

### Tugas 8

  1. Jelaskan perbedaan antara Navigator.push(), Navigator.pushReplacement(), dan Navigator.pop(). Metode apa yang digunakan untuk membuka formulir dari kartu aksi? Jelaskan juga bagaimana opsi Home di drawer membawa pengguna kembali ke halaman utama. 

   Kartu Tambah Pengalaman memakai `Navigator.push()` untuk membuka formulir di atas halaman utama. Karena halaman utama masih ada di tumpukan navigasi, tombol kembali dapat membukanya lagi. Opsi Home di drawer memakai
   `Navigator.pushReplacement()` untuk mengganti halaman aktif dengan `MyHomePage`. Saya juga memakai `Navigator.pop()` pada tombol tutup pada dialog. Saat itu yang paling atas adalah dialog, sehingga pengguna kembali
   ke formulir dan masih bisa melihat isian sebelumnya.

2. Bagaimana susunan Scaffold, AppBar, dan Drawer membantu menjaga struktur halaman tetap konsisten? Berikan satu contoh penggunaan warna tema portofolio di lebih dari satu halaman.

   Setiap halaman menggunakan `Scaffold` untuk menempatkan `AppBar`, drawer, dan konten. Beranda dan formulir pengalaman sama-sama menggunakan `Theme.of(context).colorScheme.primary` untuk latar `AppBar`. Keduanya
   juga memakai `LeftDrawer`, sehingga pengguna dapat menemukan menu Home, Tambah Proyek, dan Tambah Pengalaman di tempat yang sama.

3. Mengapa tata letak tersebut dipilih untuk formulir? Jelaskan peran widget pengatur jarak dan widget penggulir ketika ruang layar terbatas.

   Saya memakai `Column` agar pengguna dapat mengisi kolom secara berurutan dari posisi sampai URL gambar. `Padding` memberi jarak dari tepi layar, sedangkan `SizedBox` memisahkan satu input dari input berikutnya `SingleChildScrollView` membuat tombol Simpan tetap dapat dijangkau dengan discroll ketika layar pendek atau keyboardsedang terbuka.

4. Apa peran GlobalKey<FormState>, validator, dan validate() saat tombol Simpan ditekan? Berikan satu contoh nilai yang ditolak oleh validasi dan jelaskan mengapa memilih jenis input atau papan ketik saja belum cukup.

   `GlobalKey<FormState>` memberi akses ke status form. Saat Simpan ditekan, `validate()` menjalankan validator pada setiap kolom. Jika ada kesalahan,
   pesan muncul di kolom terkait. Contohnya, posisi yang hanya berisi spasi ditolak setelah teks diperiksa dengan `trim()`. Tanggal selesai juga
   ditolak jika lebih awal dari tanggal mulai. Pemilih tanggal memudahkan pengguna memasukkan tanggal, tetapi tidak memeriksa hubungan antara dua
   tanggal tersebut. Setelah semua kolom valid, `save()` mengambil isi dan `showDialog()` menampilkan ringkasannya.

### AI Disclosure 

1. Tools AI yang Digunakan

* **Generative AI Tool:** Gemini 
* **Penggunaan Utama:**  Membantu memahami persyaratan tugas, memeriksa kode Flutter, mencocokkan field formulir dengan model Experience di Django, menjelaskan penyebab serta letak error, dan serta mennangani masalah pada widget test

2. Strategi Prompting

* **Context-First Prompting:** Memberikan konteks dari tugas agar bisa memahami tujuan yang ingin dicapai, serta meminta untuk cross check proyek dango agar mencocokkan fieldnya agar tidak berbeda.
* **Constraint-Based Prompting:** Memberikan batasan scope yang dikerjakan sesuai dengan checklist minimal yang diinginkan soal
* **Verify before execute:**  Meminta penjelasan penyebab error sebelum melakukan perbaikan, serta memeriksa kembali hasilnya melalui aplikasi
  dan perintah pemeriksaan Flutter.

  3. Analisis Kritis Keterbatasan AI & Perbaikan Manual

  * **Perbedaan label pada contoh tes dan aplikasi.** Contoh tes dari AI menggunakan `Add Experience`, sedangkan saya memilih `Tambah Pengalaman` agar
    bahasa menu konsisten. Saat tes drawer dijalankan, muncul `Bad state: No element`.
    **Perbaikan manual:** Saya mencocokkan teks yang dicari oleh `pilihMenuDrawer()` dengan judul `ListTile` di drawer, lalu menjalankan ulang tes. 

  * **Masalah tata letak baru terlihat ketika drawer dibuka saat pengujian.** Log `flutter test` menampilkan `A RenderFlex overflowed by 78 pixels on 
    the bottom` dan menunjuk ke `Column` pada header di `left_drawer.dart`. Isi header membutuhkan ruang lebih tinggi ketika teksnya membungkus.
    **Perbaikan manual:** Saya memeriksa pembungkus header dan menyesuaikan tingginya agar mengikuti isi dan menghindari error. Saat pengujian berikutnya hanya menyisakan `No element`, saya paham jika ada dua masalah berbeda yang terjadi pada drawer yang sama: overflow berkaitan dengan ukuran widget, sedangkan `No element` berkaitan dengan pencarian widget di dalam tes.

  4. Log / Bukti Prompting

  > *Daftar ringkasan prompt/interaksi utama dengan AI:*
  > - **Pengguna:** *"Setelah menambahkan SingleChildScrollView, apakah susunan kurung pada widget tree yang saya perbaiki sudah benar?"*
  > - **Pengguna:** *"Mengapa muncul garis kuning-hitam dengan pesan bottom overflow pada halaman Flutter, coba jelaskan apa penyebabnya dan apa langkah     langkah mengatasinya?"*
  > - **Pengguna:** *"Mengapa flutter test masih mencari teks 0 padahal aplikasi saya sudah berupa halaman portofolio, jelaskan apa maksud dan penyebabnya lalu berikan carfa untuk mengatasinya?"*

- **Pengguna:** *"Sebelum menulis kode Experience, apa saja bagian dasar yang sudah ada di proyek ini dan bagaimana mencocokkannya dengan model Experience di Django serta pola di project_form.dart?"*
- **Pengguna:** *"Apakah tombol Simpan sudah memunculkan dialog ringkasan dan tutup dengan benar?"*
- **Pengguna:** *"Pada left_drawer.dart, terjadi overflow saat header membungkus dan No element di pilihMenuDrawer(). Jelaskan perbedaan penyebab keduanya bisa terjadi."*


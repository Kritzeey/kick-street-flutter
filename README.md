# ❓ Assignment 7 Questions
Berikut adalah jawaban untuk pertanyaan-pertanyaan pada Tugas Individu 7.

## Widget Tree

Widget Tree adalah suatu representasi struktur dari Flutter. Karena di Flutter, hampir semua hal adalah widget.

Mirip seperti pada HTML, widget induk memiliki tugas untuk "mengatur" widget anak. Karena widget anak berada di "dalam" widget induk.

Contohnya adalah widget-widget yang ada di dalam widget `Column`.

## Widget yang Digunakan

* `MaterialApp`: akar atau root dari projek dan widget lainnya.
* `Scaffold`: sebagai "kerangka" untuk struktur layout widget lainnya.
* `AppBar`: sebagai title bar atau judul aplikasi yang ada di atas aplikasi.
* `Text`: untuk menampilkan teks.
* `Padding`: untuk membuat sebuah widget dengan padding.
* `Column`: untuk membuat sebuah widget untuk mengatur posisi secara horizontal.
* `Row`: untuk membuat sebuah widget untuk mengatur posisi secara vertikal.
* `SizedBox`: membuat kotak dengan ukuran tertentu.
* `Center`: memosisikan widget anaknya di tengah.
* `GridView`: menampilkan widget dalam bentuk grid.
* `Card`: membuat sebuah desain kartu.
* `Container`: widget yang dapat menggabungkan padding, margin, border, warna background, dan ukuran.
* `Icon`: menampilkan icon.
* `SnackBar`: pesan singkat yang muncul sementara di bagian bawah.

## Fungsi dari Widget MaterialApp

Widget `MaterialApp` adalah widget yang membungkus sejumlah widget yang diperlukan untuk membangun aplikasi dengan gaya Material Design.

1. Mengatur Tema

    `MaterialApp` menyediakan `ThemeData` yang akan digunakan secara default oleh semua widget turunan.

2. Routing

    `MaterialApp` menyediakan `Navigator` bawaan untuk mengelola tumpukan layar (screen) atau halaman (page).

3.  Localization

    Widget ini juga dapat mengatur bahasa dan teks sesuai dengan region.

dan banyak hal lainnya. Karena hal-hal inilah `MaterialApp` biasanya dijadikan root dari aplikasi.

## `StatelessWidget` vs `StatefulWidget`

1. Mutability
    
    a. `StatelessWidget` tidak bisa diubah (immutable).

    b. `StatefulWidget` bisa diubah (mutable).

2. Kapan digunakan?

    a. `StatelessWidget` untuk widget yang tidak akan berubah apapun yang terjadi.

    b. `StatelessWidget` untuk widget yang state-nya akan berubah saat ada interaksi. BIasanya untuk widget-widget interaktif.

## BuildContext

`BuildContext` adalah "locator" atau penanda lokasi. `BuildContext` adalah referensi yang memberi tahu sebuah widget di mana tepatnya ia berada di dalam widget tree. Setiap widget memiliki `BuildContext`-nya sendiri.

## Hot Reload vs Hot Restart

1. Hot Reload - `r`

    Flutter "menyuntikkan" file kode Dart yang telah diperbarui ke dalam Dart Virtual Machine (VM) yang sedang berjalan.
    
    State akan disimpan. Jika user sedang mengisi formulir atau berada di suatu halaman pada aplikasi, Anda akan tetap di sana dengan data yang sama.

    Hot Reload dapat digunakan untuk perubahan UI cepat, memperbaiki layout, atau mengubah logika di dalam fungsi.

2. Hot Restart - `R`

    Flutter membuat ulang Dart VM yang sedang berjalan dan membuat VM baru dan menjalankan ulang seluruh aplikasi dari awal.

    State akan di-reset. Aplikasi kembali ke keadaan awalnya.

    Hot Restart dapat digunakan saat perubahan kode terlalu besar untuk Hot Reload, seperti mengubah state global, mengubah `main()`, atau mengganti `initState()` pada `StatefulWidget`.

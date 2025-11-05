# kick_street_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

---

## Analisis Proyek

Berikut adalah jawaban untuk pertanyaan-pertanyaan mengenai proyek Flutter ini.

### 1. Apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget?

**Widget Tree** adalah representasi struktur dari seluruh antarmuka pengguna (UI) aplikasi Flutter. Karena di Flutter "segalanya adalah widget", UI dibangun dengan menyusun widget di dalam widget lain, menciptakan hierarki yang mirip dengan struktur pohon.

**Hubungan Parent-Child (Induk-Anak):**
* **Parent (Induk):** Widget yang "mengandung" widget lain. Contohnya, widget `Column` adalah induk bagi daftar widget `children` (anak-anak) di dalamnya.
* **Child (Anak):** Widget yang terkandung di dalam widget lain.
* **Cara Kerja:** Hubungan ini sangat penting karena *parent* bertugas mengontrol *child*-nya. Parent menentukan batasan ukuran (constraints) dan posisi untuk child-nya. Child, di sisi lain, "memberi tahu" parent ukuran yang diinginkannya (size). Parent kemudian memutuskan posisi akhir child berdasarkan aturan layout-nya (misalnya, `Column` akan menumpuk anak-anaknya secara vertikal).

### 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

Berikut adalah widget-widget utama yang digunakan dalam file `main.dart` dan `menu.dart`:

* **`MaterialApp`**: Widget root yang membungkus seluruh aplikasi, menyediakan fungsionalitas dasar Material Design seperti navigasi (routing) dan tema (theming).
* **`StatelessWidget`**: Kelas dasar untuk widget yang tidak memiliki state internal (tidak dapat berubah sendiri). `MyApp`, `MyHomePage`, `InfoCard`, dan `ItemCard` adalah turunan dari widget ini.
* **`Scaffold`**: Menyediakan struktur layout visual dasar untuk aplikasi Material Design, termasuk `AppBar` dan `body`.
* **`AppBar`**: Bilah judul aplikasi yang ditampilkan di bagian atas `Scaffold`.
* **`Text`**: Widget untuk menampilkan string teks.
* **`Padding`**: Memberikan ruang kosong (padding) di sekitar widget anaknya.
* **`Column`**: Menyusun widget-widget anaknya dalam daftar vertikal.
* **`Row`**: Menyusun widget-widget anaknya dalam daftar horizontal.
* **`SizedBox`**: Membuat kotak dengan ukuran tertentu, sering digunakan untuk memberi jarak antar widget.
* **`Center`**: Memosisikan widget anaknya di tengah-tengah area yang tersedia.
* **`GridView`**: Menampilkan widget dalam bentuk grid (kisi) yang dapat digulir.
* **`Card`**: Panel Material Design dengan sudut membulat dan bayangan (elevation). Digunakan di dalam `InfoCard`.
* **`Container`**: Widget layout serbaguna yang dapat menggabungkan padding, margin, border, warna latar belakang, dan batasan ukuran.
* **`Material`**: Sebuah "kanvas" Material Design. Digunakan di `ItemCard` untuk memberi warna dan bentuk.
* **`InkWell`**: Membuat widget anaknya responsif terhadap sentuhan dan menampilkan efek "riak" (splash).
* **`Icon`**: Menampilkan ikon grafis.
* **`ScaffoldMessenger`**: Mengelola `SnackBar` dan menampilkannya di bagian bawah `Scaffold`.
* **`SnackBar`**: Pesan singkat yang muncul sementara di bagian bawah layar.

### 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

**Fungsi `MaterialApp`:**
Widget `MaterialApp` adalah widget kenyamanan (convenience widget) yang membungkus sejumlah widget yang diperlukan untuk membangun aplikasi dengan gaya Material Design. Fungsi utamanya meliputi:
1.  **Mengatur Tema (Theming):** Menyediakan `ThemeData` yang akan digunakan secara default oleh semua widget turunan (misalnya, warna `AppBar`, warna tombol, font).
2.  **Manajemen Navigasi (Routing):** Menyediakan `Navigator` bawaan untuk mengelola tumpukan layar (screen) atau halaman (page), memungkinkan kita berpindah antar halaman.
3.  **Lokalisasi (Localization):** Mengatur bahasa dan teks spesifik regional untuk aplikasi.
4.  **Menyediakan fungsionalitas Material Design** yang dibutuhkan oleh widget lain, seperti `Scaffold`.

**Mengapa menjadi Widget Root:**
`MaterialApp` digunakan sebagai widget root (akar) karena ia menyediakan **konteks dan layanan fundamental** yang dibutuhkan oleh hampir semua widget lain di dalam aplikasi. Tanpa `MaterialApp` di puncaknya, widget seperti `Scaffold`, `Navigator`, atau `Theme.of(context)` tidak akan berfungsi karena mereka bergantung pada layanan yang disediakan oleh `MaterialApp` dari atas widget tree.

### 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

Perbedaan utamanya terletak pada **kemampuan untuk berubah (mutability)**.

* **`StatelessWidget` (Widget Statis)**
    * **Deskripsi:** Widget ini *immutable* (tidak bisa berubah). Setelah dibuat, properti dan tampilannya tidak dapat diubah secara internal.
    * **Kapan digunakan:** Gunakan `StatelessWidget` ketika UI yang Anda buat **hanya bergantung pada konfigurasi** yang diterima dari parent-nya dan tidak akan pernah berubah selama masa pakainya. Contoh di proyek ini: `InfoCard`, `ItemCard`, ikon, atau teks statis.

* **`StatefulWidget` (Widget Ber-state)**
    * **Deskripsi:** Widget ini *mutable* (bisa berubah). Ia memiliki objek `State` terpisah yang menyimpan data internal (state) dan dapat diperbarui kapan saja. Ketika state berubah (dengan memanggil `setState()`), Flutter akan **membangun ulang (rebuild)** widget tersebut untuk mencerminkan state yang baru.
    * **Kapan digunakan:** Gunakan `StatefulWidget` ketika UI widget perlu **berubah secara dinamis** sebagai respons terhadap interaksi pengguna (misalnya, menekan tombol) atau data yang masuk (misalnya, timer atau data dari internet). Contoh umum: checkbox, formulir input, atau *counter* pada aplikasi demo Flutter.

### 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

**Apa itu `BuildContext`?**
`BuildContext` adalah "locator" atau penanda lokasi. Ia adalah referensi yang memberi tahu sebuah widget **di mana tepatnya ia berada** di dalam widget tree. Setiap widget memiliki `BuildContext`-nya sendiri.

**Mengapa Penting?**
`BuildContext` sangat penting karena ia adalah "pegangan" widget ke lingkungannya. Ia memungkinkan widget untuk berinteraksi dengan widget *ancestor* (leluhur atau widget di atasnya dalam tree).

Contoh paling umum adalah untuk menemukan layanan terdekat:
* `Theme.of(context)`: Mencari `ThemeData` terdekat di atasnya.
* `ScaffoldMessenger.of(context)`: Mencari `ScaffoldMessenger` terdekat untuk menampilkan `SnackBar`.
* `Navigator.of(context)`: Mencari `Navigator` terdekat untuk berpindah halaman.

**Penggunaan di Metode `build`:**
Setiap metode `build` pada `StatelessWidget` atau `State` harus menerima parameter `BuildContext context`. `context` inilah yang digunakan widget tersebut (atau anak-anaknya) untuk berinteraksi dengan tree, seperti pada contoh `ScaffoldMessenger.of(context).showSnackBar(...)` di proyek ini.

### 6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Keduanya adalah fitur yang mempercepat proses development di Flutter, namun bekerja dengan cara yang berbeda:

* **Hot Reload (Muat Ulang Instan)**
    * **Apa yang terjadi:** Flutter menyuntikkan file kode Dart yang telah diperbarui ke dalam Dart Virtual Machine (VM) yang sedang berjalan.
    * **State:** **State aplikasi tetap terjaga.** Jika Anda sedang mengisi formulir atau berada di halaman ketiga aplikasi, Anda akan tetap di sana dengan data yang sama.
    * **Kapan digunakan:** Paling sering digunakan. Ideal untuk perubahan UI cepat, memperbaiki layout, atau mengubah logika di dalam fungsi.

* **Hot Restart (Mulai Ulang Instan)**
    * **Apa yang terjadi:** Flutter menghancurkan Dart VM yang sedang berjalan dan membuat VM baru, lalu menjalankan ulang seluruh aplikasi dari awal (`main()`).
    * **State:** **State aplikasi hilang (reset).** Aplikasi kembali ke keadaan awalnya, seolah-olah Anda baru saja membukanya.
    * **Kapan digunakan:** Digunakan ketika perubahan kode terlalu besar untuk Hot Reload, seperti mengubah state global, mengubah `main()`, atau mengganti `initState()` pada `StatefulWidget`.
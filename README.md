# e_daur_mobiie

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.

Stateless widget adalah widget yang tidak memiliki status yang dapat berubah. Widget ini hanya dibangun sekali dan tidak akan diperbarui setelah itu. Contoh penggunaannya dapat dilihat pada widget yang menampilkan teks statis.

Stateful widget, di sisi lain, adalah widget yang memiliki status yang dapat berubah selama siklus hidupnya. Widget ini dapat memperbarui tampilan berdasarkan perubahan status. Contoh penggunaannya dapat dilihat pada widget yang menampilkan data dinamis, seperti form input.

Perbedaan utama antara keduanya adalah bahwa stateless widget tidak menyimpan status, sedangkan stateful widget menyimpan dan mengelola status yang dapat berubah.

## Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.

1. **MaterialApp**: Widget ini adalah root dari aplikasi Flutter yang menyediakan tema dan navigasi.

2. **Scaffold**: Memberikan struktur dasar halaman dengan AppBar, body, dan floating action button.

3. **AppBar**: Menampilkan bilah atas halaman yang berisi judul aplikasi.

4. **Padding**: Menambahkan ruang di sekitar widget di dalamnya.

5. **Column**: Menyusun widget secara vertikal.

6. **Row**: Menyusun widget secara horizontal.

7. **InfoCard**: Kartu yang menampilkan informasi seperti NPM, Nama, dan Kelas.

8. **GridView**: Menampilkan item dalam bentuk grid, memungkinkan penataan item dalam beberapa kolom.

9. **ItemCard**: Kartu yang menampilkan ikon dan nama item, serta menangani interaksi pengguna.

10. **Card**: Widget yang memberikan efek bayangan dan sudut melengkung untuk menampilkan konten.

11. **InkWell**: Menangani interaksi sentuhan pada widget, memberikan efek ripple saat ditekan.

12. **SnackBar**: Menampilkan pesan sementara di bagian bawah layar saat pengguna berinteraksi dengan ItemCard.

## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

Fungsi `setState()` digunakan dalam widget stateful untuk memberi tahu Flutter bahwa ada perubahan pada status widget yang memerlukan pembaruan tampilan. Ketika `setState()` dipanggil, Flutter akan memanggil kembali metode `build()` untuk memperbarui tampilan dengan status yang baru.

Variabel yang dapat terdampak oleh fungsi `setState()` adalah variabel yang dideklarasikan dalam kelas stateful dan digunakan dalam metode `build()`. Contohnya, jika ada variabel yang menyimpan data yang ditampilkan di UI, perubahan pada variabel tersebut melalui `setState()` akan menyebabkan UI diperbarui untuk mencerminkan perubahan tersebut.

## Jelaskan perbedaan antara const dengan final.

`const` dan `final` adalah dua cara untuk mendeklarasikan variabel di Dart, tetapi ada perbedaan penting antara keduanya:

- **const**: Variabel yang dideklarasikan dengan `const` adalah konstanta kompilasi. Artinya, nilai variabel tersebut harus ditentukan pada waktu kompilasi dan tidak dapat diubah setelahnya. `const` juga dapat digunakan untuk membuat objek yang tidak dapat diubah.

- **final**: Variabel yang dideklarasikan dengan `final` hanya dapat diinisialisasi sekali, tetapi nilainya dapat ditentukan pada waktu runtime. Setelah nilai diberikan, variabel `final` tidak dapat diubah, tetapi nilai tersebut tidak harus konstan pada waktu kompilasi.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.

### Membuat tiga tombol sederhana dengan ikon dan teks untuk:
 Melihat daftar produk (Lihat Daftar Produk)
 Menambah produk (Tambah Produk)
 Logout (Logout)

Untuk mengimplementasikan ketiga tombol tersebut, Saya menggunakan widget `ItemCard` yang sudah didefinisikan dalam kode. Berikut adalah langkah-langkah implementasinya:

1. **Mendefinisikan Data untuk Tombol**:
   Saya sudah mendefinisikan list `items` yang berisi objek `ItemHomepage`. Setiap objek ini mewakili satu tombol dengan nama, ikon, dan warna yang sesuai.

2. **Menggunakan GridView untuk Menampilkan Tombol**:
   Dalam metode `build()` dari `MyHomePage`, Saya menggunakan `GridView.count` untuk menampilkan `ItemCard` dalam bentuk grid. Setiap `ItemCard` diisi dengan data dari list `items`.

```dart
final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.mood, Colors.red.shade200),
    ItemHomepage("Tambah Produk", Icons.add, Colors.red.shade300),
    ItemHomepage("Logout", Icons.logout, Colors.red),
];

// Dalam GridView
children: items.map((ItemHomepage item) {
    return ItemCard(item);
}).toList(),
```

###  Mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Daftar Produk, Tambah Produk, dan Logout).

Untuk mengimplementasikan warna-warna yang berbeda pada setiap tombol, saya akan memperbarui list `items` dengan warna yang sesuai untuk masing-masing tombol. Berikut adalah perubahan yang diperlukan:

```dart
final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.mood, Colors.blue.shade200),
    ItemHomepage("Tambah Produk", Icons.add, Colors.green.shade300),
    ItemHomepage("Logout", Icons.logout, Colors.red.shade300),
];
```

### Menambahkan Potongan Kode untuk ItemHomepage

Saya juga menambahkan potongan kode berikut ke dalam file `lib/menu.dart` untuk mendefinisikan kelas `ItemHomepage`, yang menyimpan informasi tentang nama, ikon, dan warna untuk setiap item:

```dart
class ItemHomepage {
    final String name;
    final IconData icon;
    final Color color;

    ItemHomepage(this.name, this.icon, this.color);
}
```

Potongan kode ini mendefinisikan struktur data yang digunakan untuk menyimpan informasi tentang setiap tombol yang ditampilkan dalam aplikasi. Dengan cara ini, kita dapat dengan mudah mengelola dan menampilkan warna untuk setiap tombol.

### Memunculkan Snackbar dengan tulisan:
 "Kamu telah menekan tombol Lihat Daftar Produk" ketika tombol Lihat Daftar Produk ditekan.
 "Kamu telah menekan tombol Tambah Produk" ketika tombol Tambah Produk ditekan.
 "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.

### Penjelasan Kode untuk Memunculkan Snackbar

Potongan kode berikut adalah bagian dari implementasi untuk menampilkan pesan Snackbar ketika pengguna menekan tombol yang diwakili oleh `InkWell`:

```dart
child: InkWell(
  // Aksi ketika kartu ditekan.
  onTap: () {
    // Menampilkan pesan SnackBar saat kartu ditekan.
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
      );
  },
```

#### Penjelasan Kode:

1. **`child: InkWell(`**:
   - `InkWell` adalah widget yang memberikan efek sentuhan (ripple effect) ketika pengguna menekan area yang ditentukan. Dalam konteks ini, `InkWell` membungkus konten kartu, sehingga ketika kartu ditekan, efek visual akan ditampilkan.

2. **`onTap: () {`**:
   - `onTap` adalah callback yang dipanggil ketika pengguna menekan widget `InkWell`. Di dalam blok ini, Kita dapat menentukan tindakan yang ingin dilakukan saat kartu ditekan.

3. **`ScaffoldMessenger.of(context)`**:
   - `ScaffoldMessenger` adalah widget yang digunakan untuk menampilkan SnackBar, BottomSheet, dan dialog. Dengan menggunakan `ScaffoldMessenger.of(context)`, User mendapatkan akses ke `ScaffoldMessenger` yang terkait dengan konteks saat ini.

4. **`..hideCurrentSnackBar()`**:
   - Operator `..` adalah operator cascade yang memungkinkan Anda untuk memanggil beberapa metode pada objek yang sama. Dalam hal ini, `hideCurrentSnackBar()` digunakan untuk menyembunyikan SnackBar yang mungkin sedang ditampilkan sebelum menampilkan yang baru. Ini memastikan bahwa hanya satu SnackBar yang ditampilkan pada satu waktu.

5. **`..showSnackBar(`**:
   - Metode `showSnackBar` digunakan untuk menampilkan SnackBar baru. SnackBar adalah widget yang menampilkan pesan singkat di bagian bawah layar.

6. **`SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))`**:
   - Di sini, Anda membuat instance baru dari `SnackBar` dan mengatur kontennya. Pesan yang ditampilkan adalah "Kamu telah menekan tombol ${item.name}!", di mana `${item.name}` akan digantikan dengan nama item yang sesuai (misalnya, "Lihat Daftar Produk", "Tambah Produk", atau "Logout"). Ini memberikan umpan balik langsung kepada pengguna tentang tombol mana yang mereka tekan.

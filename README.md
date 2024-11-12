# e_daur_mobiie
## TUGAS 7

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


## TUGAS 8

### Definisi dan Kegunaan const di Flutter

`const` di Flutter digunakan untuk mendeklarasikan variabel yang nilainya tidak berubah. Dengan menggunakan `const`, Anda dapat menentukan bahwa nilai variabel tidak akan berubah setelah deklarasi. Hal ini membantu dalam meningkatkan kinerja aplikasi karena Flutter dapat mengoptimalkan widget yang tidak berubah.

#### Kapan Sebaiknya Menggunakan const

Menggunakan `const` di Flutter sebaiknya dilakukan dalam situasi-situasi berikut:

* Ketika nilai variabel tidak berubah dan dapat ditentukan pada saat kompilasi.
* Ketika Anda ingin mengoptimalkan kinerja aplikasi dengan mengurangi penggunaan memori dan mengurangi kemungkinan error.
* Ketika Anda ingin meningkatkan stabilitas aplikasi dengan mengurangi kemungkinan perubahan nilai yang tidak diinginkan.

#### Kekurangan dan Kapan Sebaiknya Tidak Menggunakan const

Namun, menggunakan `const` juga memiliki beberapa kekurangan dan situasi di mana sebaiknya tidak digunakan, seperti:

* Tidak dapat digunakan untuk variabel yang nilainya berubah.
* Tidak dapat digunakan untuk variabel yang bergantung pada nilai lain yang berubah.
* Tidak dapat digunakan untuk variabel yang nilainya ditentukan pada saat runtime.
* Sebaiknya tidak digunakan untuk variabel yang nilainya dapat berubah berdasarkan kondisi tertentu.

Dengan demikian, menggunakan `const` di Flutter dapat membantu meningkatkan kinerja dan stabilitas aplikasi, namun harus digunakan dengan hati-hati dan hanya untuk variabel yang nilainya tidak berubah.

### Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!

Column dan Row adalah dua jenis layout widget yang paling umum digunakan dalam Flutter untuk mengatur tata letak widget lainnya. Keduanya digunakan untuk mengatur widget dalam suatu baris atau kolom, tetapi dengan tujuan yang berbeda.

**Column**

Column digunakan untuk mengatur widget dalam suatu kolom vertikal. Widget ini sangat berguna ketika Anda ingin mengatur beberapa widget dalam suatu urutan vertikal, seperti mengatur tombol, teks, atau gambar dalam suatu kolom.

Contoh implementasi Column:
```dart
Column(
  children: [
    Text('Widget 1'),
    Text('Widget 2'),
    Text('Widget 3'),
  ],
)
```
Dalam contoh di atas, tiga widget Text akan ditampilkan dalam suatu kolom vertikal.

**Row**

Row digunakan untuk mengatur widget dalam suatu baris horizontal. Widget ini sangat berguna ketika Anda ingin mengatur beberapa widget dalam suatu urutan horizontal, seperti mengatur tombol, teks, atau gambar dalam suatu baris.

Contoh implementasi Row:
```dart
Row(
  children: [
    Text('Widget 1'),
    Text('Widget 2'),
    Text('Widget 3'),
  ],
)
```
Dalam contoh di atas, tiga widget Text akan ditampilkan dalam suatu baris horizontal.

**Perbandingan**

Berikut adalah perbandingan antara Column dan Row:

|  | Column | Row |
| --- | --- | --- |
| Arah | Vertikal | Horizontal |
| Penggunaan | Mengatur widget dalam suatu kolom | Mengatur widget dalam suatu baris |
| Contoh Penggunaan | Mengatur tombol, teks, atau gambar dalam suatu kolom | Mengatur tombol, teks, atau gambar dalam suatu baris |

Dalam Flutter, Anda dapat menggunakan Column dan Row untuk mengatur tata letak widget lainnya dengan lebih efektif dan efisien.

###  Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!

#### Elemen Input yang Digunakan pada Halaman Form

Pada halaman form yang saya buat, terdapat tiga elemen input yang digunakan, yaitu:

1. **TextFormField untuk Product**: 
   - Digunakan untuk memasukkan nama produk. Memiliki validasi untuk memastikan bahwa input tidak kosong.

2. **TextFormField untuk Description**: 
   - Digunakan untuk memasukkan deskripsi produk. Juga memiliki validasi untuk memastikan bahwa input tidak kosong.

3. **TextFormField untuk Rating**: 
   - Digunakan untuk memasukkan rating produk. Memiliki validasi untuk memastikan bahwa input tidak kosong dan harus berupa angka.

#### Elemen Input Flutter Lain yang Tidak Digunakan

Beberapa elemen input Flutter lain yang tidak digunakan pada tugas ini antara lain:

- **Checkbox**: Digunakan untuk memilih satu atau beberapa opsi dari beberapa pilihan.
- **Radio**: Digunakan untuk memilih satu opsi dari beberapa pilihan yang tersedia.
- **Switch**: Digunakan untuk mengubah status antara dua keadaan (on/off).
- **DropdownButton**: Digunakan untuk memilih satu opsi dari daftar dropdown.
- **DatePicker**: Digunakan untuk memilih tanggal dari kalender.

Masing-masing elemen input ini memiliki kegunaan yang berbeda dan dapat digunakan sesuai dengan kebutuhan aplikasi.

### Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?

```dart
theme: ThemeData(
         colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.red,
        ).copyWith(secondary: const Color.fromARGB(0, 222, 49, 99)),
        useMaterial3: true,
```

Untuk mengatur tema dalam aplikasi Flutter agar konsisten, kita dapat menggunakan `ThemeData` yang disediakan oleh Flutter. Dalam contoh di atas, kita dapat melihat bagaimana tema diatur menggunakan `colorScheme` untuk menentukan warna utama dan sekunder aplikasi. Dengan menggunakan `ThemeData`, kita dapat mengatur berbagai aspek tampilan aplikasi, seperti warna, font, dan lain-lain, untuk mencapai konsistensi tampilan.

Pada aplikasi yang saya buat, tema telah diimplementasikan menggunakan `ThemeData` untuk menentukan warna utama dan sekunder aplikasi. Dengan demikian, aplikasi akan memiliki tampilan yang konsisten dan sesuai dengan tema yang diinginkan.

### Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?

Untuk menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter, saya menggunakan `Navigator` dan `MaterialPageRoute`. Berikut adalah langkah-langkah yang saya lakukan:

1. **Menggunakan Navigator**:
   - Saya memanfaatkan `Navigator.push()` untuk berpindah dari satu halaman ke halaman lain. Metode ini menambahkan halaman baru ke tumpukan navigasi.

2. **Membuat MaterialPageRoute**:
   - Saya membuat instance dari `MaterialPageRoute` yang menerima builder untuk halaman yang ingin dituju. Ini memungkinkan saya untuk menentukan halaman baru yang akan ditampilkan.

3. **Contoh Implementasi**:
   - Dalam kode `ItemCard`, ketika pengguna menekan tombol "Tambah Produk", saya menggunakan `Navigator.push()` untuk membuka halaman `ProductEntryFormPage`.

```dart
if (item.name == "Tambah Produk") {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ProductEntryFormPage()),
  );
}
```

4. **Navigasi Kembali**:
   - Untuk kembali ke halaman sebelumnya, saya dapat menggunakan `Navigator.pop(context)`, yang akan menghapus halaman teratas dari tumpukan navigasi.

Dengan cara ini, saya dapat dengan mudah mengelola navigasi antar halaman dalam aplikasi Flutter, memberikan pengalaman pengguna yang mulus dan intuitif.

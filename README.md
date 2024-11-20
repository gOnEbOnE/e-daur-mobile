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


## TUGAS 9

### Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?

Membuat model untuk pengambilan dan pengiriman data JSON sangat penting karena beberapa alasan. Pertama, model membantu dalam mengorganisir data JSON yang diterima atau dikirim menjadi struktur yang lebih mudah dipahami dan diolah. Kedua, model memungkinkan kita untuk mengkonversi data JSON menjadi objek yang dapat digunakan dalam aplikasi Flutter kita.

Jika kita tidak membuat model terlebih dahulu, maka kita akan menghadapi beberapa masalah. Salah satunya adalah kesulitan dalam mengakses dan mengolah data JSON karena tidak ada struktur yang jelas untuk data tersebut. Selain itu, kita juga mungkin akan menghadapi error karena tidak ada cara yang efektif untuk mengkonversi data JSON menjadi objek yang dapat digunakan dalam aplikasi.

Dalam direktori `lib` pada proyek Flutter ini, kita dapat menemukan contoh model seperti `MaterialEntry` yang digunakan untuk mengorganisir data produk. Model ini membantu dalam mengkonversi data JSON menjadi objek `Product` yang dapat digunakan dalam aplikasi untuk menampilkan atau mengolah data produk.

Dengan demikian, membuat model untuk pengambilan dan pengiriman data JSON sangat penting untuk memastikan bahwa data dapat diolah dan digunakan dengan efektif dalam aplikasi Flutter.

### Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
Library http digunakan untuk melakukan komunikasi antara aplikasi Flutter dan server backend melalui protokol HTTP. Pada tugas ini, library http memiliki peran penting dalam menghubungkan aplikasi Flutter sebagai front-end dengan server Django sebagai back-end. Berikut adalah fungsi utama dari library http yang diimplementasikan:

Mengambil Data dari API (GET Request): Library http digunakan untuk mengirim permintaan HTTP ke endpoint API Django (http://127.0.0.1:8000/json/) menggunakan metode GET. Hasil respons berupa data dalam format JSON.

Parsing Data JSON: Data JSON yang diterima dari respons HTTP di-decode menjadi objek Dart menggunakan fungsi json.decode. Data ini kemudian diolah menjadi model ProductEntry agar dapat ditampilkan dalam aplikasi.

Koneksi Client-Server: Library ini berfungsi sebagai penghubung antara aplikasi Flutter dengan server Django. Proses ini memungkinkan aplikasi untuk mengambil data real-time dari server, sehingga UI dapat menampilkan informasi terkini.

Mendukung Operasi Asinkron: Dengan memanfaatkan mekanisme asinkron (async dan await), aplikasi Flutter dapat menunggu respons dari server tanpa membekukan UI. Hal ini memastikan bahwa pengguna tetap mendapatkan pengalaman yang responsif selama aplikasi berjalan.

Fungsi Utama yang Digunakan:

http.get: Fungsi ini digunakan untuk mengambil data dari server.

final response = await http.get(Uri.parse('http://127.0.0.1:8000/json/'));

Hasil dari fungsi ini berupa data yang nantinya diolah lebih lanjut dalam aplikasi.
Dengan implementasi library http, aplikasi mampu berkomunikasi dengan server untuk mengambil dan menampilkan data secara dinamis.

### Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest adalah kelas yang digunakan untuk menangani permintaan HTTP dengan manajemen sesi berbasis cookie. Dalam konteks aplikasi Flutter, CookieRequest memungkinkan aplikasi untuk mengelola autentikasi pengguna, menjaga sesi aktif, dan menyimpan status login menggunakan cookie yang disimpan selama komunikasi client-server.

Fungsi Utama CookieRequest:
Menyimpan Cookie:

Setelah pengguna login, server biasanya mengirimkan cookie untuk menandai sesi pengguna. CookieRequest menyimpan cookie ini sehingga setiap permintaan selanjutnya akan menyertakan cookie tersebut, menjaga status autentikasi pengguna.
Mengirim Permintaan HTTP:

CookieRequest digunakan untuk mengirim permintaan HTTP seperti GET dan POST. Cookie yang disimpan akan disertakan secara otomatis dalam setiap permintaan, memastikan bahwa server dapat mengenali pengguna yang sudah login.
Memastikan Keamanan:

Dengan menyertakan cookie, aplikasi dapat memastikan bahwa hanya pengguna yang terautentikasi yang dapat mengakses endpoint yang memerlukan login.
Mendukung Logout:

Ketika pengguna logout, CookieRequest dapat menghapus cookie yang tersimpan, sehingga sesi pengguna dianggap berakhir.
Mengapa Instance CookieRequest Perlu Dibagikan ke Semua Komponen?
Manajemen Sesi yang Konsisten:

Dengan membagikan instance CookieRequest ke seluruh aplikasi menggunakan Provider, semua komponen dapat mengakses cookie yang sama. Hal ini memastikan bahwa sesi pengguna tetap konsisten di semua bagian aplikasi, seperti halaman login, daftar produk, atau halaman profil.
Mudah Digunakan di Seluruh Aplikasi:

Alih-alih menginisialisasi CookieRequest berulang kali di setiap komponen, instance yang sama dapat digunakan kembali. Hal ini mengurangi kompleksitas dan risiko inkonsistensi dalam manajemen sesi.
Memungkinkan Akses Data yang Dibutuhkan:

Banyak fitur aplikasi, seperti memuat data pengguna atau menampilkan konten yang dipersonalisasi, memerlukan data sesi. Dengan membagikan instance CookieRequest, komponen lain dapat menggunakannya untuk mengakses informasi yang relevan.
Efisiensi:

Membagikan instance menghindari overhead pembuatan objek CookieRequest baru setiap kali dibutuhkan, sehingga aplikasi lebih efisien dalam hal performa.
Kemudahan Manajemen Status:

Menggunakan Provider untuk berbagi instance mempermudah pengelolaan status sesi di aplikasi Flutter, terutama jika status ini perlu diperbarui atau dihapus secara global, seperti saat logout.
Dengan menggunakan CookieRequest yang dibagikan ke semua komponen, aplikasi Flutter dapat memastikan manajemen sesi yang efisien, aman, dan konsisten di seluruh bagian aplikasi.

### Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Proses pengiriman data dari input hingga ditampilkan pada aplikasi Flutter melibatkan beberapa langkah utama, baik di sisi back-end maupun front-end. Berikut adalah penjelasan lengkapnya:

1. Penginputan Data oleh Pengguna
Proses: Pengguna memasukkan data melalui form di aplikasi Flutter, seperti nama, deskripsi, atau data lainnya.
Komponen:
Widget form di Flutter, seperti TextFormField, DropdownButton, atau DatePicker.
Data ini akan dikumpulkan dalam sebuah model atau map untuk dikirim ke server.

2. Pengiriman Data ke Back-End
Proses: Data yang diinput pengguna dikirimkan ke server melalui permintaan HTTP (biasanya metode POST).
Komponen:
Library HTTP atau CookieRequest: Digunakan untuk mengirimkan permintaan HTTP.
Endpoint API di server: Menangani data yang dikirimkan.
Format Data:
Data dikirimkan dalam format JSON agar dapat dengan mudah diproses oleh server.
Contoh Kode:
final response = await request.post(
  'http://127.0.0.1:8000/add/',
  {
    'nama': nama,
    'deskripsi': deskripsi,
    'harga': harga,
    'rating': rating,
  },
);

3. Pemrosesan Data di Server
Proses:
Data yang diterima server diproses oleh back-end (misalnya, Django).
Server memvalidasi data, menyimpannya ke database, dan memberikan respons ke aplikasi.
Komponen:
Views di Django: Mengambil data dari permintaan HTTP dan memvalidasi input.
Database: Menyimpan data di tabel yang relevan.
Respons:
Server mengembalikan respons berupa status keberhasilan (success/failure) dan, jika perlu, data terbaru.

4. Pengambilan Data oleh Flutter
Proses:
Aplikasi Flutter mengirimkan permintaan HTTP (biasanya GET) ke endpoint API untuk mengambil data yang telah disimpan di server.
Komponen:
Library seperti http atau CookieRequest untuk mengirim permintaan GET.

Contoh Kode:
final response = await request.get('http://127.0.0.1:8000/json/');
List<ProductEntry> products = productEntryFromJson(response);

5. Dekode dan Parsing Data
Proses:
Data respons yang diterima dalam format JSON diubah menjadi objek Dart menggunakan fungsi parsing.
Komponen:
Model Dart (ProductEntry): Merepresentasikan struktur data.
Fungsi parsing: Mengubah data JSON menjadi list objek Dart.

Contoh Kode:
List<ProductEntry> products = productEntryFromJson(responseBody);

6. Menampilkan Data pada UI Flutter
Proses:
Data yang telah diparsing ditampilkan di widget Flutter, seperti ListView atau GridView.
Komponen:
Widget UI: Menampilkan data dalam format yang user-friendly.
State Management: Mengelola data secara dinamis agar perubahan pada data langsung tercermin di UI.

Contoh Kode:
ListView.builder(
  itemCount: products.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(products[index].fields.nama),
      subtitle: Text(products[index].fields.deskripsi),
    );
  },
);

### Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django
### Langkah-langkah Autentikasi

1. **Input Informasi Login**:
   - Pengguna memasukkan informasi login (misalnya, username dan password) pada halaman login di aplikasi Flutter.

2. **Pengiriman Data Login**:
   - Data login dikirim ke server Django menggunakan permintaan POST ke endpoint login (misalnya, `/auth/login/`). Data ini biasanya dikirim dalam format JSON.

3. **Validasi di Server Django**:
   - Django memeriksa data yang diterima, melakukan validasi password (biasanya menggunakan model User dan fungsi `authenticate()` dari Django). 
   - Jika data yang diterima valid, Django mengirimkan respons yang berisi token autentikasi atau cookie yang menandakan sesi pengguna aktif.

4. **Penyimpanan Token atau Cookie**:
   - Token atau cookie autentikasi disimpan di aplikasi Flutter, misalnya menggunakan package seperti `shared_preferences` untuk menyimpan token yang diperlukan untuk autentikasi di permintaan HTTP selanjutnya.

5. **Akses Menu Aplikasi**:
   - Setelah autentikasi berhasil, menu aplikasi yang hanya dapat diakses oleh pengguna yang telah login ditampilkan. 
   - Aplikasi Flutter memeriksa apakah token autentikasi tersedia untuk memastikan pengguna sudah terautentikasi sebelum menampilkan menu.

6. **Proses Logout**:
   - Ketika pengguna memilih untuk logout, token atau cookie yang disimpan dihapus dan permintaan logout dikirim ke server Django, biasanya menggunakan POST ke endpoint logout (misalnya, `/auth/logout/`).
   - Setelah logout berhasil, pengguna diarahkan kembali ke halaman login.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step!
#### Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.

Untuk mengimplementasikan fitur registrasi akun pada proyek Flutter, berikut adalah langkah-langkah yang diambil berdasarkan kode dalam `register.dart`:

1. **Membuat Halaman Registrasi**:
   - Halaman registrasi dibuat dengan menggunakan `RegisterPage` yang merupakan widget stateful. Halaman ini memiliki form untuk memasukkan username, password, dan konfirmasi password.

2. **Menggunakan Controller untuk Input**:
   - Tiga `TextEditingController` digunakan untuk mengelola input dari pengguna: `_usernameController`, `_passwordController`, dan `_confirmPasswordController`.

3. **Membuat UI Form**:
   - UI form dibangun menggunakan `TextFormField` untuk setiap input. Setiap field memiliki validasi untuk memastikan bahwa input tidak kosong.

4. **Mengirim Data ke Server**:
   - Ketika tombol "Register" ditekan, data dari form (username, password1, dan password2) dikirim ke server menggunakan metode `postJson` dari `CookieRequest`. URL yang digunakan adalah `http://127.0.0.1:8000/auth/register/`.

5. **Menangani Respons dari Server**:
   - Setelah mengirim data, respons dari server diperiksa. Jika statusnya 'success', pengguna akan mendapatkan notifikasi bahwa registrasi berhasil dan diarahkan ke halaman login. Jika gagal, pengguna akan mendapatkan notifikasi bahwa registrasi gagal.

6. **Menampilkan Notifikasi**:
   - Notifikasi ditampilkan menggunakan `SnackBar` untuk memberikan umpan balik kepada pengguna tentang status registrasi.

Dengan langkah-langkah ini, fitur registrasi akun berhasil diimplementasikan dalam aplikasi Flutter, memungkinkan pengguna untuk mendaftar dengan akun baru.

#### Membuat Halaman Login pada Proyek Tugas Flutter

Untuk membuat halaman login pada proyek Flutter, langkah-langkah berikut diambil:

1. **Membuat Struktur Halaman**:
   - Halaman login diimplementasikan dalam kelas `LoginPage`, yang merupakan widget stateful. Halaman ini memiliki tampilan yang bersih dan responsif.

2. **Menggunakan Controller untuk Input**:
   - Dua `TextEditingController` digunakan untuk mengelola input dari pengguna: `_usernameController` untuk username dan `_passwordController` untuk password.

3. **Membangun UI Form**:
   - UI form dibangun menggunakan `TextField` untuk setiap input. Setiap field memiliki dekorasi yang jelas, termasuk label dan hint text, serta border yang melingkar.

4. **Menangani Login**:
   - Ketika tombol "Login" ditekan, data dari form (username dan password) dikirim ke server menggunakan metode `login` dari `CookieRequest`. URL yang digunakan adalah `http://127.0.0.1:8000/auth/login/`.

5. **Menangani Respons dari Server**:
   - Setelah mengirim data, respons dari server diperiksa. Jika login berhasil, pengguna akan diarahkan ke halaman utama (`MyHomePage`) dan mendapatkan notifikasi selamat datang. Jika gagal, dialog akan ditampilkan dengan pesan kesalahan.

6. **Navigasi ke Halaman Registrasi**:
   - Terdapat opsi untuk pengguna yang belum memiliki akun untuk mendaftar. Ketika teks "Don't have an account? Register" ditekan, pengguna akan diarahkan ke halaman registrasi (`RegisterPage`).

#### Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
Pada langkah ini, yang saya lakukan adalah:

Menginstall package flutter berikut:
flutter pub add provider
flutter pub add pbp_django_auth

Lalu mengubah main.dart untuk menambahkan provider dan cookie request:
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:mental_health_tracker_mobile/screens/login.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'E-Daur',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.red,
          ).copyWith(secondary: const Color.fromARGB(0, 222, 49, 99)),
          useMaterial3: true,
        ),
        home: const LoginPage(),
      ),
    );
  }
}

#### Membuat model kustom sesuai dengan proyek aplikasi Django 

// To parse this JSON data, do
//
//     final materialEntry = materialEntryFromJson(jsonString);

import 'dart:convert';

List<MaterialEntry> materialEntryFromJson(String str) => List<MaterialEntry>.from(json.decode(str).map((x) => MaterialEntry.fromJson(x)));

String materialEntryToJson(List<MaterialEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MaterialEntry {
    String model;
    String pk;
    Fields fields;

- Kelas ini merepresentasikan entitas MaterialEntry dengan tiga atribut: model, pk, dan fields.
model dan pk adalah string yang menyimpan informasi tentang model dan primary key dari entitas.
fields adalah objek dari kelas Fields yang menyimpan detail lebih lanjut tentang entitas.

    MaterialEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory MaterialEntry.fromJson(Map<String, dynamic> json) => MaterialEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    - Metode ini digunakan untuk membuat objek MaterialEntry dari Map yang dihasilkan dari JSON.
Mengambil nilai dari Map dan menginisialisasi atribut kelas.

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };

    - Metode ini mengonversi objek MaterialEntry menjadi Map, yang kemudian dapat di-encode menjadi JSON.

}

class Fields {
    int user;
    String nama;
    DateTime time;
    int harga;
    String deskripsi;
    String image;
    int rating;

    - Kelas ini merepresentasikan detail dari entitas MaterialEntry, dengan atribut seperti user, nama, time, harga, deskripsi, image, dan rating.

    Fields({
        required this.user,
        required this.nama,
        required this.time,
        required this.harga,
        required this.deskripsi,
        required this.image,
        required this.rating,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        nama: json["nama"],
        time: DateTime.parse(json["time"]),
        harga: json["harga"],
        deskripsi: json["deskripsi"],
        image: json["image"],
        rating: json["rating"],
    );

    - Metode ini mengonversi Map JSON menjadi objek Fields.


    Map<String, dynamic> toJson() => {
        "user": user,
        "nama": nama,
        "time": "${time.year.toString().padLeft(4, '0')}-${time.month.toString().padLeft(2, '0')}-${time.day.toString().padLeft(2, '0')}",
        "harga": harga,
        "deskripsi": deskripsi,
        "image": image,
        "rating": rating,
    };

   - Metode ini mengonversi objek Fields menjadi Map, dengan format khusus untuk tanggal.
}

####  Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.


import 'package:flutter/material.dart';
import 'package:mental_health_tracker_mobile/models/product_entry.dart';
import 'package:mental_health_tracker_mobile/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductEntryPage extends StatefulWidget {
  const ProductEntryPage({super.key});

  @override
  State<ProductEntryPage> createState() => _ProductEntryPageState();
}

class _ProductEntryPageState extends State<ProductEntryPage> {
  Future<List<MaterialEntry>> fetchProduct(CookieRequest request) async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    final response = await request.get('http://127.0.0.1:8000/json/');
    
    // Melakukan decode response menjadi bentuk json
    var data = response;
    
    // Melakukan konversi data json menjadi object ProductEntry
    List<MaterialEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(MaterialEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'Belum ada data Product pada mental health tracker.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${snapshot.data![index].fields.nama}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.deskripsi}"),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.rating}"),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.time}")
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}

####  Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
import 'package:flutter/material.dart';
import 'package:mental_health_tracker_mobile/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final MaterialEntry product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.fields.nama,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text("Description: ${product.fields.deskripsi}"),
            const SizedBox(height: 8),
            Text("Price: ${product.fields.harga}"),
            const SizedBox(height: 8),
            Text("Rating: ${product.fields.rating}"),
          ],
        ),
      ),
    );
  }
}

} else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  final product = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(product: product),
                        ),

membuat file baru pada screens lalu mengubah list_productentry 

####  Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.

  Future<List<MaterialEntry>> fetchProduct(CookieRequest request) async {

menambah potongan kode di atas agar hanya menampilkan product dari user yang sedang login
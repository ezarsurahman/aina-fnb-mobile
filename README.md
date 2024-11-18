# Aina FNB Mobile
Nama : Ezar Akhdan Shada Surahman
NPM : 2306165894
Kelas : PBP B

<details>
    <summary>Tugas 7</summary>

#### Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
1. **Stateless Widget**
Stateless Widget adalah sebuah widget (sebuah _reusable component_) yang tidak berubah dengan sendirinya melalui aksi atau perilaku internal. Stateless widget hanya akan berubah jika diubah oleh parent widgetnya. Oleh karena itu, stateless widget hanya memiliki properti bersifat `final` yang didefinisikan saat construction.
2. **Stateful Widget**
Stateful Widget adalah sebuah widget yang bisa mengubah data atau deskripsi nya secara dinamis. Stateful widget menampilkan data melalui initial description yang sudah di-definisikan di awal. Jika ada perubahan state, maka komponen widget akan di re-render untuk menampilkan data yang baru.

Secara garis besar, Stateless Widget adalah widget yang bersifat statis dan tidak berubah setelah dibuat, cocok untuk elemen yang tidak memerlukan pembaruan data. Stateful Widget, di sisi lain, dapat berubah selama aplikasi berjalan karena memiliki state yang dapat diperbarui, cocok untuk elemen yang dinamis atau interaktif.

#### Widget yang digunakan pada proyek ini
Berikut adalah widget yang digunakan pada proyek ini:
1. **MaterialApp** 
Root widget aplikasi, mengatur tema dan titik awal aplikasi.
2. **Scaffold** 
Struktur dasar halaman yang menyediakan AppBar, body, dan struktur layout lainnya.
3. **AppBar** 
Header bagian atas halaman yang berisi judul aplikasi.
4. **Text** 
Menampilkan teks statis di layar.
5. **Padding** 
Menambahkan jarak di sekitar widget.
6. **Column** 
Menyusun widget secara vertikal.
7. **Row** 
Menyusun widget secara horizontal.
8. **InfoCard (Widget/Component buatan)** 
Widget kartu khusus untuk menampilkan informasi NPM, nama, dan kelas.
9. **SizedBox** 
Memberikan jarak kosong atau memanipulasi ukuran widget.
10. **Center** 
Memposisikan widget anaknya di tengah.
11. **GridView.count** 
Menampilkan widget dalam bentuk grid dengan jumlah kolom tetap.
12. **Card** 
Widget kartu dengan elemen yang bisa diberi bayangan atau border.
13. **Container** 
Widget fleksibel untuk menyimpan elemen dan mengatur ukuran, padding, serta warna latar belakang.
14. **ItemCard (Widget/Component buatan)** 
Widget kartu khusus untuk item menu yang menggunakan InkWell untuk mendeteksi interaksi.
15. **Material** 
Menambahkan visual material pada widget.
16. **InkWell** 
Menambahkan efek splash dan mendeteksi tap untuk interaksi.
17. **SnackBar** 
Menampilkan pesan pop-up sementara di bagian bawah layar.

#### Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
`setState()` merupakan sebuah function yang memungkinkan untuk menampilkan sebuah component/widget secara dinamis. Saat fungsi `setState()` dipanggil, ini sama saja seperti memberi tahu Flutter bahwa terdapat perubahan pada state yang memerlukan sebuah rebuild. Saat widget melakukan rebuild, widget tersebut akan ditampilkan berdasarkan nilai state yang diubah

Variabel yang terdampak oleh `setState()` biasanya merupakan variabel variabel yang diharuskan untuk berubah saat ada sebuah event. Contohnya seperti saat sebuah nilai `counter` berubah, perubahan tersebut biasanya akan ditampilkan langsung kepada user. Tidak hanya variabel, perubahan properti seperti warna (`Color`) sebuah widget juga sangat mungkin untuk berubah, tergantung dengan tujuan perubahan state tersebut.

#### Jelaskan perbedaan antara `const` dengan `final`
Sebenarnya, `const` dan `final` sama sama menandakan bahwa sebuah variabel tidak bisa diubah, namun terdapat beberapa perbedaan dari keduamya, sebagai berikut:
1. Value dari `final` bisa ditetapkan saat runtime (saat aplikasi sudah berjalan), sedangkan value dari variabel `const` harus sudah diketahui dari proses kompilasi.
2. Variabel yang menggunakan `final` lebih cocok untuk sebuah value yang hanya bisa diketahui saat aplikasi berjalan, contohnya jika variabel tersebut bergantung pada sebuah condition atau perhitungan. Di lain sisi, variabel yang menggunakan `const` harus sudah ditentukan dari kode.
3. Variabel yang menggunakan `const` lebih optimal dibandingkan menggunakan `final`.

#### Implementasi checklist
1. Pertama, untuk menginisiasi sebuah proyek Flutter, saya menjalankan command `flutter create aina_fnb_mobile`.
2. Selanjutnya, saya membuat sebuah file baru bernama `menu.dart` di direktori `aina_fnb_mobile/lib` agar struktur proyek lebih rapi.
3. Pada file `main.dart` yang ada di direktori yang sama, saya menghapus class `_MyHomePageState` karena widget yang ingin dibuat merupakan sebuah stateless widget.
4. Saya juga mengubah parent class dari `MyHomePage` dari `StatefulWidget` menjadi `StatelessWidget`. 
5. Selanjutnya, saya menghapus seluruh isi class `MyHomePage` lalu membuat sebuah constructor `MyHomePage({super.key});` dan function `build()` yang akan di isi nantinya
```
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Masih kosong
  }
}
```
6. Untuk menyesuaikan dengan perubahan yang dibuat, saya merubah attribute `home` pada widget `MaterialApp` dengan:
```
home: MyHomePage(),
```
7. Dikarenakan saya ingin merubah nuansa hijau dan kuning pada proyek ini, saya juga mengubah attribute `colorScheme` pada widget `MaterialApp`
```
colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
          ).copyWith(secondary: Colors.amber[400]),
        useMaterial3: true,
```
8. Agar lebih terstruktur, saya memindahkan class `MyHomePage()` ke file `menu.dart` lalu mengimportnya ke file `main.dart` dengan:
```
import 'package:aina_fnb_mobile/menu.dart';
```
9. Untuk menampilkan card yang berisikan informasi mahasiswa saya, saya membuat widget stateless bernama `InfoCard`
```
class InfoCard extends StatelessWidget {
  // Kartu informasi yang menampilkan title dan content.

  final String title;  // Judul kartu.
  final String content;  // Isi kartu.

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Membuat kotak kartu dengan bayangan dibawahnya.
      elevation: 2.0,
      child: Container(
        // Mengatur ukuran dan jarak di dalam kartu.
        width: MediaQuery.of(context).size.width / 3.5, // menyesuaikan dengan lebar device yang digunakan.
        padding: const EdgeInsets.all(16.0),
        // Menyusun title dan content secara vertikal.
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}
```
10. Untuk menampilkan button-button, saya membuat sebuah class `ItemHomepage` yang akan memiliki 3 properti (nama, icon, dan warna):
```
class ItemHomepage {
    final String name;
    final IconData icon;
    final Color color;

    ItemHomepage(this.name, this.icon, this.color);
}
```
11. Selanjutnya, saya membuat List yang menampung 3 button yang ingin ditampilkan di dalam widget `MyHomePage`, masing masing memiliki warna yang berbeda
```
final List<ItemHomepage> items = [
        ItemHomepage("Lihat Daftar Produk", Icons.fastfood, Colors.amberAccent),
        ItemHomepage("Tambah Produk", Icons.add, Colors.greenAccent),
        ItemHomepage("Logout", Icons.logout,Colors.blueAccent),
      ];
```
12. Untuk membuat style dalam bentuk sebuah card, saya membuat widget stateless yaitu `ItemCard`
```
class ItemCard extends StatelessWidget {
  // Menampilkan kartu dengan ikon dan nama.

  final ItemHomepage item; 
  
  const ItemCard(this.item, {super.key}); 

  @override
  Widget build(BuildContext context) {
    return Material(
      // Menentukan warna latar belakang dari tema aplikasi.
      color: item.color,
      // Membuat sudut kartu melengkung.
      borderRadius: BorderRadius.circular(12),
      
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
        // Container untuk menyimpan Icon dan Text
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              // Menyusun ikon dan teks di tengah kartu.
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.blueGrey[900]!,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Color.fromARGB(255, 37, 49, 55)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}
```
13. Terakhir, saya menampilkan `ItemCard` dan `InfoCard` dengan beserta dengan layout dan styling pada fungsi `build()` di `MyHomePage()`
```
@override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur dasar halaman dengan AppBar dan body.
    return Scaffold(
      // AppBar adalah bagian atas halaman yang menampilkan judul.
      appBar: AppBar(
        // Judul aplikasi "Mental Health Tracker" dengan teks putih dan tebal.
        title: const Text(
          'Aina FNB',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Warna latar belakang AppBar diambil dari skema warna tema aplikasi.
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      // Body halaman dengan padding di sekelilingnya.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Menyusun widget secara vertikal dalam sebuah kolom.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Row untuk menampilkan 3 InfoCard secara horizontal.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),

            // Memberikan jarak vertikal 16 unit.
            const SizedBox(height: 16.0),

            // Menempatkan widget berikutnya di tengah halaman.
            Center(
              child: Column(
                // Menyusun teks dan grid item secara vertikal.

                children: [
                  // Menampilkan teks sambutan dengan gaya tebal dan ukuran 18.
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Welcome to Aina FNB',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),

                  // Grid untuk menampilkan ItemCard dalam bentuk grid 3 kolom.
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    // Agar grid menyesuaikan tinggi kontennya.
                    shrinkWrap: true,

                    // Menampilkan ItemCard untuk setiap item dalam list items.
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
```
</details>

<details>
<summary>Tugas 8</summary>

#### Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan `const` pada kode Flutter. Kapan sebaiknya kita menggunakan `const`, dan kapan sebaiknya tidak digunakan?
Di Flutter, `const` digunakan untuk membuat objek yang bersifat *immutable* dan diproses pada waktu kompilasi (*compile-time constant*). Menggunakan `const` memungkinkan Flutter untuk menghindari pembuatan ulang objek yang sama berulang kali saat *rebuild*, sehingga meningkatkan efisiensi aplikasi. Misalnya, jika sebuah widget atau nilai dideklarasikan dengan `const`, Flutter akan menyimpannya sebagai satu objek tunggal dalam memori, dan referensi yang sama akan digunakan setiap kali diperlukan, yang menghemat sumber daya.

Sebaiknya gunakan `const` pada widget atau nilai yang tidak berubah sepanjang waktu, seperti teks statis atau ikon yang tetap. Ini sangat berguna dalam mengoptimalkan performa aplikasi, terutama saat bekerja dengan widget yang sering di-*rebuild*. Namun, hindari penggunaan `const` jika nilai atau tampilan suatu widget bergantung pada data dinamis yang bisa berubah saat aplikasi berjalan, karena `const` tidak dapat digunakan untuk elemen yang berubah di runtime.

#### Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
1. Column : Menyusun anaknya secara vertikal
```
Column(
  children: [
    Image.network(
      _image,
      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
        return const Text('Gagal memuat gambar');
      },
    ),
    Text('Name: $_name'),
    Text('Price: $_price'),
    Text('Ready: $_ready'),
    Text('Description: $_description'),
  ],
),
```
2. Row : Menyusun anaknya secara horizontal
```
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    InfoCard(title: 'NPM', content: npm),
    InfoCard(title: 'Name', content: name),
    InfoCard(title: 'Class', content: className),
  ],
),
```
#### Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Dalam kode halaman form ini, berikut adalah elemen input yang digunakan:

1. `TextFormField`:
Digunakan untuk beberapa input teks:
URL Image: Input untuk URL gambar dari menu.
Name: Input untuk nama menu.
Price: Input untuk harga menu.
Ready/No: Input untuk status ketersediaan, yang harus diisi dengan "Ready" atau "No".
Description: Input untuk deskripsi menu.
Masing-masing TextFormField memiliki properti validator untuk memvalidasi input dan memastikan data sesuai format yang diinginkan.

2. `ElevatedButton`:
Digunakan untuk tombol "Save" yang akan menampilkan dialog konfirmasi ketika form valid.

Ada beberapa elemen input lainnya di Flutter yang tidak digunakan pada form ini:

1. `DropdownButtonFormField`: Widget ini dapat digunakan untuk membuat dropdown pilihan. Ini bisa menjadi alternatif untuk input "Ready/No" agar pengguna memilih dari pilihan yang tersedia daripada mengetik manual.

2. `Checkbox` atau Switch: Berguna untuk input tipe boolean atau status aktif/tidak aktif. Misalnya, untuk status "Ready", bisa menggunakan Checkbox atau Switch sebagai alternatif.

3. `Slider`: Berguna untuk input angka dalam rentang tertentu, seperti memilih harga dalam rentang yang sudah ditentukan.

4. `DatePicker` dan `TimePicker`: Widget ini digunakan untuk input tanggal dan waktu, cocok untuk aplikasi yang memerlukan pemilihan tanggal/waktu, misalnya untuk menentukan tanggal ketersediaan menu tertentu.



#### Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Saya menggunakan `ThemeData` pada sebuah `MaterialApp` untuk mendapatkan warna yang konsistent di keseluruhan aplikasi.

#### Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Dalam proyek ini, saya mengelola navigasi antar halaman menggunakan widget `Navigator`. Saya menggunakan fungsi seperti `Navigator.push()` untuk menambahkan halaman baru ke dalam stack, dan `Navigator.pop()` untuk kembali ke halaman sebelumnya. Selain itu, ketika ingin mengganti halaman yang sedang ditampilkan tanpa menambahkannya ke dalam stack, saya menggunakan `Navigator.pushReplacement()`. Untuk mempermudah navigasi, saya juga menambahkan sebuah drawer agar pengguna dapat dengan mudah berpindah antara halaman utama dan halaman form. Tombol pada halaman utama dikonfigurasi dengan `Navigator` untuk mengarahkan pengguna ke halaman form saat ditekan.

</details>

<details>
<summary>Tugas 9</summary>

#### Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?

Membuat model untuk melakukan pengambilan atau pengiriman data JSON sangat penting karena model tersebut berfungsi sebagai struktur atau _blueprint_ yang mendefinisikan bagaimana data JSON akan dipetakan ke dalam objek dalam aplikasi. Dengan model, kita dapat dengan mudah mengonversi data JSON yang diterima dari API menjadi objek yang dapat digunakan dalam kode Dart, serta memastikan bahwa data yang dikirim ke API sesuai dengan format yang diharapkan. Model juga membantu dalam validasi data dan memudahkan debugging karena kita dapat dengan jelas melihat struktur data yang sedang digunakan.

Jika kita tidak membuat model terlebih dahulu, kita mungkin masih bisa bekerja dengan data JSON menggunakan _map_ atau _list_ secara langsung, tetapi ini akan membuat kode menjadi lebih sulit dibaca dan dipelihara. Selain itu, tanpa model, kita tidak memiliki jaminan bahwa struktur data yang kita terima atau kirim sesuai dengan yang diharapkan, yang dapat menyebabkan error runtime yang sulit dilacak dan diperbaiki. Model memberikan tipe data yang kuat dan eksplisit, yang membantu mencegah kesalahan dan meningkatkan keandalan aplikasi.

#### Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
Library `http` dalam Dart digunakan untuk melakukan permintaan HTTP ke server. Dalam konteks tugas ini, library `http` digunakan untuk mengirim dan menerima data dari server Django yang berjalan di localhost. Fungsi utama dari library ini adalah untuk memungkinkan aplikasi Flutter berkomunikasi dengan backend melalui protokol HTTP, baik itu untuk melakukan operasi GET, POST, PUT, DELETE, dan lain-lain.

Dengan menggunakan library `http`, aplikasi dapat mengirim data JSON ke server dan menerima respons dalam format JSON juga. Ini sangat penting untuk mengimplementasikan fitur seperti login, register, pengambilan data menu makanan, dan pengiriman data menu baru. Library ini menyediakan cara yang mudah dan efisien untuk menangani permintaan HTTP dan mengelola responsnya, sehingga memudahkan pengembangan aplikasi yang membutuhkan komunikasi dengan server.

#### Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
`CookieRequest` adalah kelas yang digunakan untuk mengelola permintaan HTTP yang memerlukan autentikasi berbasis cookie. Kelas ini mempermudah pengiriman permintaan HTTP dengan menyertakan cookie yang diperlukan untuk menjaga sesi pengguna tetap aktif. `CookieRequest` juga menyediakan metode untuk login, logout, dan mengirim permintaan HTTP lainnya dengan cookie yang sudah disimpan.

Instance `CookieRequest` perlu dibagikan ke semua komponen di aplikasi Flutter karena banyak komponen yang memerlukan akses ke sesi pengguna yang sedang aktif. Dengan membagikan instance `CookieRequest` menggunakan `Provider`, semua komponen dapat dengan mudah mengakses dan menggunakan metode yang disediakan oleh `CookieRequest` untuk melakukan operasi yang memerlukan autentikasi, seperti mengambil data dari server atau mengirim data ke server. Ini memastikan bahwa semua permintaan HTTP yang memerlukan autentikasi dapat dilakukan dengan benar dan konsisten di seluruh aplikasi.

#### Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
1. **Pengambilan Input dari Pengguna**: Pengguna memasukkan data melalui form yang disediakan di aplikasi Flutter. Data ini kemudian dikumpulkan dan divalidasi sebelum dikirim ke server. Misalnya, pada form penambahan menu, pengguna mengisi detail seperti URL gambar, nama, harga, status ketersediaan, dan deskripsi.

2. **Pengiriman Data ke Server**: Setelah data divalidasi, aplikasi Flutter menggunakan library seperti http atau pbp_django_auth untuk mengirim data ke server melalui permintaan HTTP POST. Data yang dikirim biasanya dalam format JSON. Contoh pengiriman data menggunakan CookieRequest:

3. **Pemrosesan Data di Server**: Server menerima data yang dikirim oleh aplikasi Flutter dan memprosesnya sesuai dengan logika bisnis yang telah ditentukan. Server kemudian menyimpan data tersebut ke dalam database dan mengirimkan respons kembali ke aplikasi Flutter, biasanya dalam format JSON yang berisi status operasi dan data yang relevan.

4. **Menampilkan Data di Aplikasi Flutter**: Aplikasi Flutter menerima respons dari server dan memprosesnya. Data yang diterima kemudian ditampilkan di UI aplikasi. Misalnya, setelah menambahkan menu baru, aplikasi dapat menampilkan daftar menu yang diperbarui dengan mengambil data dari server menggunakan permintaan HTTP GET dan menampilkan data tersebut dalam bentuk list atau grid.


Dengan mekanisme ini, data dapat dikirim dari input pengguna, diproses oleh server, dan ditampilkan kembali di aplikasi Flutter, memastikan alur data yang konsisten dan terintegrasi.

#### Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

**Register:**

1. Input Data Akun: Pengguna memasukkan data akun seperti username dan password melalui form register di aplikasi Flutter.
2. Pengiriman Data ke Server: Data yang dimasukkan dikirim ke server Django menggunakan permintaan HTTP POST. Contoh pengiriman data:
```dart
final response = await request.postJson(
    "http://localhost:8000/auth/register/",
    jsonEncode({
      "username": username,
      "password1": password1,
      "password2": password2,
    }));
```
3. Pemrosesan di Server: Server Django memproses data yang diterima, memvalidasi, dan menyimpan data akun baru ke database. Jika berhasil, server mengirimkan respons sukses.
4. Tampilan di Flutter: Aplikasi Flutter menerima respons dari server dan menampilkan pesan sukses atau gagal. Jika sukses, pengguna diarahkan ke halaman login.

**Login:**
1. Input Data Akun: Pengguna memasukkan username dan password melalui form login di aplikasi Flutter.
2. Pengiriman Data ke Server: Data login dikirim ke server Django menggunakan permintaan HTTP POST. Contoh pengiriman data:
```dart
final response = await request.login(
    "http://localhost:8000/auth/login/",
    {'username': username, 'password': password});
```
3. Pemrosesan di Server: Server Django memverifikasi kredensial yang diterima. Jika valid, server mengirimkan cookie sesi yang menandakan bahwa pengguna telah berhasil login.
4. Tampilan di Flutter: Aplikasi Flutter menerima cookie sesi dan menyimpannya. Pengguna diarahkan ke halaman utama (menu) dan pesan selamat datang ditampilkan.

**Logout:**
1. Permintaan Logout: Pengguna menekan tombol logout di aplikasi Flutter.
2. Pengiriman Permintaan ke Server: Aplikasi Flutter mengirim permintaan logout ke server Django menggunakan permintaan HTTP POST. Contoh pengiriman data:
```dart
final response = await request.logout("http://localhost:8000/auth/logout/");
```

#### Implementasi Checklist
1. Selanjutnya, saya membuat sebuah file baru bernama `register.dart` di direktori `aina_fnb_mobile/lib/screens` untuk halaman registrasi akun.
2. Pada file `register.dart`, saya membuat halaman registrasi dengan form untuk username, password, dan konfirmasi password, serta tombol untuk mengirim data ke server Django.
```dart
import 'dart:convert';
import 'package:aina_fnb_mobile/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: 'Confirm your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      String username = _usernameController.text;
                      String password1 = _passwordController.text;
                      String password2 = _confirmPasswordController.text;

                      // Cek kredensial
                      // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                      // Untuk menyambungkan Android emulator dengan Django pada localhost,
                      // gunakan URL http://10.0.2.2/
                      final response = await request.postJson(
                          "http://localhost:8000/auth/register/",
                          jsonEncode({
                            "username": username,
                            "password1": password1,
                            "password2": password2,
                          }));
                      if (context.mounted) {
                        if (response['status'] == 'success') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Successfully registered!'),
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Failed to register!'),
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
3. Saya mengintegrasikan sistem autentikasi Django dengan proyek Flutter menggunakan package `pbp_django_auth` dan `provider`.
4. Saya membuat halaman login pada proyek tugas Flutter di file `login.dart` di direktori `aina_fnb_mobile/lib/screens`.
5. Saya membuat model kustom sesuai dengan proyek aplikasi Django di file `food_entry.dart` di direktori `aina_fnb_mobile/lib/models`.
```dart
// To parse this JSON data, do
//
//     final foodEntry = foodEntryFromJson(jsonString);

import 'dart:convert';

List<FoodEntry> foodEntryFromJson(String str) => List<FoodEntry>.from(json.decode(str).map((x) => FoodEntry.fromJson(x)));

String foodEntryToJson(List<FoodEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodEntry {
    String model;
    String pk;
    Fields fields;

    FoodEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory FoodEntry.fromJson(Map<String, dynamic> json) => FoodEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String img;
    String name;
    int price;
    String ready;
    String description;

    Fields({
        required this.user,
        required this.img,
        required this.name,
        required this.price,
        required this.ready,
        required this.description,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        img: json["img"],
        name: json["name"],
        price: json["price"],
        ready: json["ready"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "img": img,
        "name": name,
        "price": price,
        "ready": ready,
        "description": description,
    };
}
```
6. Saya membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah saya deploy di file `list_food_entry.dart` di direktori `aina_fnb_mobile/lib/screens`.
7. Saya membuat halaman detail untuk setiap item yang terdapat pada halaman daftar item di file `food_detail.dart` di direktori `aina_fnb_mobile/lib/screens`.
8. Saya melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login di file `list_food_entry.dart`.
```dart
@override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchFood(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
            
          } else {
            if (snapshot.data.length == 0) {
              
              return Center(
                child:
                  Column(
                    children: [
                      Text(
                        'Belum ada Menu pada Aina FNB.',
                        style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.primary),
                      ),
                      SizedBox(height: 8),
                    ],
                  )
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => InkWell(
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    decoration:  BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image.network("${snapshot.data![index].fields.img}"),
                        Text(
                          "${snapshot.data![index].fields.name}",
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text("${snapshot.data![index].fields.price}"),
                        const SizedBox(height: 10),
                        // Text("${snapshot.data![index].fields.ready}"),
                        // const SizedBox(height: 10),
                        Text("${snapshot.data![index].fields.description}")
                      ],
                    ),
                  ),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FoodDetailPage(foodID:  snapshot.data![index].pk),
                    ))
                },
                )
              );
            }
          }
        },
      ),
    );
  }
```

</details>
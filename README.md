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
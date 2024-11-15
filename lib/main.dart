import 'package:flutter/material.dart'; // Mengimpor pustaka Flutter untuk antarmuka pengguna.
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; // Mengimpor pustaka untuk rating bintang.

void main() {
  runApp(const MyApp()); // Memulai aplikasi dengan widget MyApp sebagai root.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Widget ini adalah root dari aplikasi.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menyembunyikan banner debug di aplikasi.
      theme: ThemeData(
        primarySwatch: Colors.blue, // Menetapkan warna tema utama aplikasi.
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Item Product Coffee'), // Judul di bagian AppBar.
          centerTitle: true, // Menempatkan judul di tengah AppBar.
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0), // Memberikan padding di sekitar konten ListView.
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 5), // Memberikan padding hanya pada bagian atas kontainer.
                width: 220, // Menetapkan lebar kontainer.
                decoration: BoxDecoration(
                  color: Colors.brown[50], // Memberikan warna latar belakang untuk kontainer produk.
                ),
                child: Column(
                  children: [
                    // Membungkus gambar produk dengan ClipRRect untuk membulatkan sudutnya.
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12), // Membulatkan sudut kiri atas.
                        topRight: Radius.circular(12), // Membulatkan sudut kanan atas.
                        bottomLeft: Radius.circular(100), // Membulatkan sudut kiri bawah.
                        bottomRight: Radius.circular(100), // Membulatkan sudut kanan bawah.
                      ),
                      child: Image.network(
                        'https://images.pexels.com/photos/7362647/pexels-photo-7362647.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // Gambar produk dari URL.
                        height: 250, // Menetapkan tinggi gambar.
                        width: 200, // Menetapkan lebar gambar.
                        fit: BoxFit.cover, // Mengatur gambar agar menutupi area dengan ukuran yang sesuai.
                      ),
                    ),
                    const SizedBox(height: 10), // Memberikan jarak antara gambar dan teks.
                    Padding(
                      padding: const EdgeInsets.all(16), // Padding di sekitar konten teks.
                      child: Column(
                        children: [
                          Text(
                            'Cappucino Coffee', // Nama produk.
                            style: TextStyle(
                              color: Colors.brown[700], // Warna teks nama produk.
                              fontSize: 18, // Ukuran font nama produk.
                              fontWeight: FontWeight.bold, // Menjadikan nama produk tebal.
                            ),
                          ),
                          const SizedBox(height: 8), // Memberikan jarak antara nama produk dan harga.
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center, // Memusatkan teks di dalam baris.
                            children: [
                              Text(
                                'Rp. 30.000', // Harga produk dengan diskon.
                                style: TextStyle(
                                  color: Colors.deepOrange, // Warna teks harga diskon.
                                  fontSize: 16, // Ukuran font harga diskon.
                                  fontWeight: FontWeight.bold, // Membuat harga diskon tebal.
                                ),
                              ),
                              SizedBox(width: 8), // Jarak antara harga diskon dan harga asli.
                              Text(
                                'Rp. 45.000', // Harga asli produk.
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough, // Membuat garis coret di harga asli.
                                  color: Colors.brown, // Warna teks harga asli.
                                  fontSize: 12, // Ukuran font harga asli.
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8), // Memberikan jarak antara harga dan rating.
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center, // Memusatkan rating dan jumlah review.
                            children: [
                              // RatingBar untuk menampilkan rating produk dalam bentuk bintang.
                              RatingBar.builder(
                                initialRating: 3.5, // Rating awal.
                                maxRating: 1, // Nilai rating maksimum, tetapi diabaikan karena kita menggunakan initialRating.
                                direction: Axis.horizontal, // Rating yang ditampilkan secara horizontal.
                                allowHalfRating: true, // Mengizinkan rating dengan setengah bintang.
                                itemCount: 5, // Jumlah bintang.
                                itemSize: 18, // Ukuran setiap bintang.
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.yellow[600], // Warna bintang.
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating); // Menampilkan rating di konsol ketika rating diperbarui.
                                },
                                ignoreGestures: true, // Mengabaikan interaksi pengguna agar rating tidak dapat diubah.
                              ),
                              const SizedBox(width: 8), // Memberikan jarak antara rating dan jumlah ulasan.
                              const Text(
                                '3.2k reviews', // Menampilkan jumlah ulasan produk.
                                style: TextStyle(
                                  color: Colors.brown, // Warna teks jumlah ulasan.
                                  fontSize: 12, // Ukuran font jumlah ulasan.
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25), // Memberikan jarak antara rating dan tombol.
                          TextButton(
                            onPressed: () {
                              print('Shop Now'); // Menampilkan teks 'Shop Now' ketika tombol ditekan.
                            },
                            style: ButtonStyle(
                              padding: MaterialStateProperty.resolveWith((states) {
                                return const EdgeInsets.symmetric(horizontal: 30, vertical: 15); // Padding pada tombol.
                              }),
                              backgroundColor: MaterialStateProperty.resolveWith((states) {
                                return Colors.brown[700]; // Warna latar belakang tombol.
                              }),
                              foregroundColor: MaterialStateProperty.resolveWith((states) {
                                return Colors.white; // Warna teks tombol.
                              }),
                              shape: MaterialStateProperty.resolveWith((states) {
                                return RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30), // Membulatkan sudut tombol.
                                );
                              }),
                            ),
                            child: const Text('Shop Now'), // Teks tombol "Shop Now".
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// DATA MOTOR BEKAS
final List<Map<String, dynamic>> motorBekas = [
  {
    'nama': 'Honda Beat 2021',
    'harga': 13500000,
    'ikon': Icons.two_wheeler,
    'warna': Color(0xFF0284C7), // Crystal Blue
  },
  {
    'nama': 'Yamaha NMAX 2020',
    'harga': 24000000,
    'ikon': Icons.motorcycle,
    'warna': Color(0xFF0F172A), // Glossy Black
  },
  {
    'nama': 'Vespa Sprint 2019',
    'harga': 38000000,
    'ikon': Icons.moped,
    'warna': Color(0xFF0077B6), // Deep Crystal Blue
  },
];

// APLIKASI UTAMA
Widget MyApp() {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Penjualan Motor Bekas',
    home: HomePage(),
  );
}

// HALAMAN HOME
Widget HomePage() {
  return Builder(
    builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Penjualan Motor Bekas'),
          backgroundColor: const Color(0xFF0F172A), // Glossy Black
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.person),
              tooltip: 'About Me',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AboutPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // STACK
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0284C7), // Crystal Blue
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const Text(
                    'WELCOME TO MOTOR BEKAS SHOP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ROW
              const Row(
                children: [
                  Text('Kategori Motor', style: TextStyle(fontSize: 18)),
                  SizedBox(width: 10),
                  Icon(Icons.two_wheeler, color: Color(0xFF0284C7)),
                ],
              ),

              const SizedBox(height: 20),

              // GRIDVIEW
              SizedBox(
                height: 90,
                child: GridView.count(
                  crossAxisCount: 3,
                  children: const [
                    Column(
                      children: [
                        Icon(Icons.two_wheeler, size: 35, color: Color(0xFF0284C7)),
                        Text('Matic'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.motorcycle, size: 35, color: Color(0xFF0F172A)),
                        Text('Sport'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.moped, size: 35, color: Color(0xFF0077B6)),
                        Text('Bebek'),
                      ],
                    ),
                  ],
                ),
              ),

              // LISTVIEW
              Expanded(
                child: ListView.builder(
                  itemCount: motorBekas.length,
                  itemBuilder: (context, index) {
                    final item = motorBekas[index];

                    return Card(
                      child: ListTile(
                        leading: Icon(
                          item['ikon'] as IconData,
                          color: item['warna'] as Color,
                          size: 35,
                        ),
                        title: Text(item['nama'] as String),
                        subtitle: Text('Harga: Rp${item['harga']}'),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),

                        // NAVIGASI DAN PENGIRIMAN DATA
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailPage(
                                  nama: item['nama'] as String,
                                  harga: item['harga'] as int,
                                  ikon: item['ikon'] as IconData,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

// HALAMAN DETAIL MOTOR BEKAS
Widget DetailPage({
  required String nama,
  required int harga,
  required IconData ikon,
}) {
  return Builder(
    builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Motor Bekas'),
          backgroundColor: const Color(0xFF0F172A),
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(ikon, size: 90, color: const Color(0xFF0284C7)),

              const SizedBox(height: 20),

              Text(
                nama,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text('Harga: Rp$harga', style: const TextStyle(fontSize: 20)),

              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F172A),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Kembali ke Home'),
              ),
            ],
          ),
        ),
      );
    },
  );
}

// HALAMAN ABOUT ME
Widget AboutPage() {
  return Builder(
    builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('About Me'),
          backgroundColor: const Color(0xFF0F172A),
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 45,
                backgroundColor: Color(0xFF0284C7), // Crystal Blue
                child: Icon(Icons.person, size: 55, color: Colors.white),
              ),

              const SizedBox(height: 15),

              const Text(
                'ABOUT ME',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              const Text(
                'Nama: Muhamad Luthfi Abdullah',
                style: TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 5),

              const Text(
                'NPM: 24670109',
                style: TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 5),

              const Text(
                'Status: Mahasiswa',
                style: TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F172A),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Kembali'),
              ),
            ],
          ),
        ),
      );
    },
  );
}

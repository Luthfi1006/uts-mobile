import 'package:flutter/material.dart';
import 'homepage.dart' hide MyApp;

// StatelessWidget
// Widget yang tampilannya tidak mengalami perubahan
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Nama aplikasi
      title: "Penjualan Motor Bekas",

      // Halaman awal aplikasi
      home: HomePage(),
    );
  }
}

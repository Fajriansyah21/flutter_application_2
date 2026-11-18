import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pertemuan_9/counter/hitung_provider.dart';
import 'package:provider/provider.dart';

// Import halaman
import 'package:flutter_application_2/Pertemuan_10/katalog_page.dart';
import 'package:flutter_application_2/Pertemuan_10/keranjang_page.dart';

// Import Provider
import 'package:flutter_application_2/Pertemuan_10/keranjang_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (context) => HitunggProvider()),
        ChangeNotifierProvider(create: (context) => KeranjangProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        '/': (context) => const KatalogPage(),
        '/keranjang': (context) => const KeranjangPage(),
      },

      initialRoute: '/',
    );
  }
}

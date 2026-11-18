import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Import halaman
import 'package:flutter_application_2/PraktikumMandiri/menu_resto_page.dart';
import 'package:flutter_application_2/PraktikumMandiri/nota_pesanan_page.dart';

// Import Provider
import 'package:flutter_application_2/PraktikumMandiri/resto_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => RestoProvider())],
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
        '/menu-resto': (context) => const MenuRestoPage(),
        '/pesanan-resto': (context) => const NotaPesananPage(),
      },

      initialRoute: '/menu-resto',
    );
  }
}

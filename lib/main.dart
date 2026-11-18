import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pertemuan_9/counter/hitung_provider.dart';
import 'package:flutter_application_2/Pertemuan_9/form/page_1.dart';
import 'package:flutter_application_2/Pertemuan_9/counter/page_2.dart';
import 'package:flutter_application_2/Pertemuan_9/counter/page_3.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HitungProvider(),
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
      routes: {'/': (context) => Page2(), '/3': (context) => Page3()},
      initialRoute: '/',
    );
  }
}

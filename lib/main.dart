import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pertemuan_9/page_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'/': (context) => Page1()},
      initialRoute: '/',
    );
  }
}

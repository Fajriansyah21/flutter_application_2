import 'package:flutter/material.dart';

class RestoProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _pesanan = [];

  // methode untuk mendapatkan pesanan
  List<Map<String, dynamic>> get pesanan => _pesanan;

  // method untuk menghitung total pesanan
  int get totalItemPesanan {
    int total = 0;

    for (var item in _pesanan) {
      total += int.parse(item['jumlah']);
    }

    return total;
  }
}

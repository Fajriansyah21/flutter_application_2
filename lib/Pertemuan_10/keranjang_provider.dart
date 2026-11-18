import 'package:flutter/material.dart';

class KeranjangProvider extends ChangeNotifier {
  final List<String> _items = [];

  // methode untuk mendapatkan item keranjang
  List<String> get items => _items;

  // method untuk mendapatkan jumlah item di keranjang
  int get jumlahItem => _items.length;

  void tambahItem(String namaProduk) {
    _items.add(namaProduk);
    notifyListeners();
  }
}

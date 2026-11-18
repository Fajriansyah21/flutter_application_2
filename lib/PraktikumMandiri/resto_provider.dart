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

  // method untuk menghitung total pembayaran
  int get totalBayar {
    int total = 0;

    for (var item in _pesanan) {
      total += int.parse(item['subtotal']);
    }

    return total;
  }

  // methode untuk menambah pesanan
  void tambahPesanan(Map<String, dynamic> item) {
    int index = _pesanan.indexWhere((pesanan) => pesanan['id'] == item['id']);

    if (index != -1) {
      int jumlah = int.parse(_pesanan[index]['jumlah']);
      jumlah++;

      _pesanan[index]['jumlah'] = jumlah.toString();
      _pesanan[index]['subtotal'] =
          (jumlah * int.parse(_pesanan[index]['harga'])).toString();
    } else {
      _pesanan.add({
        'id': item['id'],
        'jumlah': '1',
        'harga': item['harga'],
        'subtotal': item['harga'],
      });
    }

    notifyListeners();
  }
}

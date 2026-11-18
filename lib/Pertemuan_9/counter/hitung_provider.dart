import 'package:flutter/material.dart';

class HitungProvider extends ChangeNotifier {
  // Siapkan variable yang nilainya akan dibagikan
  // Set modifier nya ke private dengan tanda _
  int _angka = 0;

  // buatkan method getter
  int get angka => _angka;

  // buat method untuk menambah angka + 1
  void tambah() {
    _angka++;
    notifyListeners();
  }

  // buat method untuk menambah angka - 1
  void kurang() {
    _angka--;
    notifyListeners();
  }
}

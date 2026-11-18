import 'package:flutter/material.dart';

class RestoProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _pesanan = [];

  final List<Map<String, dynamic>> _menu = [
    {
      'id': 'M01',
      'nama': 'Nasi Goreng Spesial',
      'harga': '25000',
      'stok': '15',
      'gambar':
          'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=300',
    },
    {
      'id': 'M02',
      'nama': 'Mie Ayam Jamur Bakso',
      'harga': '20000',
      'stok': '20',
      'gambar':
          'https://images.unsplash.com/photo-1612927601601-6638404737ce?w=300',
    },
    {
      'id': 'M03',
      'nama': 'Ayam Geprek Sambal Matah',
      'harga': '22000',
      'stok': '8',
      'gambar':
          'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?w=300',
    },
    {
      'id': 'M04',
      'nama': 'Es Kopi Susu Aren',
      'harga': '15000',
      'stok': '30',
      'gambar':
          'https://images.unsplash.com/photo-1517701604599-bb29b565090c?w=300',
    },
    {
      'id': 'M05',
      'nama': 'Es Lemon Tea Segar',
      'harga': '8000',
      'stok': '40',
      'gambar':
          'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=300',
    },
  ];

  List<Map<String, dynamic>> get menu => _menu;

  Map<String, dynamic>? cariMenu(String id) {
    for (var item in _menu) {
      if (item['id'] == id) {
        return item;
      }
    }

    return null;
  }

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
    final menu = cariMenu(item['id']);

    if (menu == null) return;

    int stok = int.parse(menu['stok']);

    // Cek apakah stok masih tersedia
    if (stok <= 0) return;

    // Kurangi stok sebanyak 1
    menu['stok'] = (stok - 1).toString();

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

  // method untuk mengosongkan semua pesanan
  void kosongkanPesanan() {
    // Kembalikan stok semua menu
    for (var pesanan in _pesanan) {
      final menu = cariMenu(pesanan['id']);

      if (menu != null) {
        int stok = int.parse(menu['stok']);
        int jumlah = int.parse(pesanan['jumlah']);

        menu['stok'] = (stok + jumlah).toString();
      }
    }

    // Kosongkan daftar pesanan
    _pesanan.clear();

    notifyListeners();
  }

  // method untuk menghapus pesanan berdasarkan ID
  void hapusItemPesanan(String id) {
    // Cari data pesanan berdasarkan ID
    int index = _pesanan.indexWhere((item) => item['id'] == id);

    if (index == -1) return;

    // Ambil jumlah pesanan yang akan dihapus
    int jumlah = int.parse(_pesanan[index]['jumlah']);

    // Cari menu aslinya
    final menu = cariMenu(id);

    // Kembalikan stok sesuai jumlah pesanan
    if (menu != null) {
      int stok = int.parse(menu['stok']);
      menu['stok'] = (stok + jumlah).toString();
    }

    // Hapus pesanan dari daftar
    _pesanan.removeAt(index);

    notifyListeners();
  }
}

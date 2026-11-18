import 'package:flutter/material.dart';

class KeranjangPage extends StatelessWidget {
  const KeranjangPage({super.key});

  static const List<String> _itemKeranjang = [
    'Buku Flutter Dasar',
    'Kopi Susu Kampus',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Isi Keranjang'),
        actions: [TextButton(onPressed: () {}, child: const Text('Kosongkan'))],
      ),
      body: _itemKeranjang.isEmpty
          ? const Center(
              child: Text(
                'Keranjang masih kosong',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _itemKeranjang.length,
              itemBuilder: (context, index) {
                final namaProduk = _itemKeranjang[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text(namaProduk),
                    trailing: IconButton(
                      tooltip: 'Hapus item',
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () {},
                    ),
                  ),
                );
              },
            ),
    );
  }
}

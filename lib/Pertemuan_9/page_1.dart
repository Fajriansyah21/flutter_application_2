import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const new({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final TextEditingController _namapengguna = TextEditingController();

  @override
  void dispose() {
    _namapengguna.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Latihan input form')),
      body: Center(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(10),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: _namapengguna,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nama Pengguna',
                    hintText: 'Masukkan Nama Pengguna',
                    // prefixText: 'Nama : ',
                    prefixIcon: Icon(Icons.person),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),

                SizedBox(height: 20),

                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Masukkan Password Anda',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.visibility_off_rounded),
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 20),

                Text(_namapengguna.text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

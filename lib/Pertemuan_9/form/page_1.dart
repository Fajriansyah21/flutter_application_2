import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const new({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final TextEditingController _namapengguna = TextEditingController();
  final _kunci = GlobalKey<FormState>();

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
            key: _kunci,
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
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Nama Pengguna wajib di isi";
                    } else if (value.length <= 6) {
                      return "Nama Pengguna Minimal 6 Karakter";
                    }
                    return null;
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
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Password wajib di isi";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                Text(_namapengguna.text),

                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    if (!_kunci.currentState!.validate()) return;
                    print(_namapengguna.text);
                  },
                  child: Text("Simpan"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pertemuan_9/counter/hitung_provider.dart';
import 'package:flutter_application_2/Pertemuan_9/form/page_1.dart';
import 'package:provider/provider.dart';

class Page2 extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Consumer<HitungProvider>(
              builder: (context, hitung, child) => Text(
                hitung.angka.toString(),
                style: TextStyle(fontSize: 28, fontWeight: .bold),
              ),
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: .center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<HitungProvider>().kurang();
                  },
                  child: Icon(Icons.remove),
                ),

                SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {
                    context.read<HitungProvider>().tambah();
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/3');
              },
              child: Text("Ke halaman 3"),
            ),
          ],
        ),
      ),
    );
  }
}

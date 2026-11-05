import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class Produk {
  final String nama;
  final int harga;

  const Produk(this.nama, this.harga);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DaftarProduk(),
    );
  }
}

class DaftarProduk extends StatelessWidget {
  const DaftarProduk({super.key});

  static const List<Produk> produk = [
    Produk('Buku Tulis', 15000),
    Produk('Botol Minum', 45000),
    Produk('Tas Sekolah', 120000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Produk')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: produk.length,
        itemBuilder: (context, index) {
          final p = produk[index];
          return Card(
            child: ListTile(
              title: Text(p.nama),
              subtitle: Text('Rp ${p.harga}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailProduk(produk: p),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailProduk extends StatelessWidget {
  final Produk produk;

  const DetailProduk({super.key, required this.produk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(produk.nama, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 8),
            Text('Harga: Rp ${produk.harga}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}

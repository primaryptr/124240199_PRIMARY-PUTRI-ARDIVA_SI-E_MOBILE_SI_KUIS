import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const CircleAvatar(
              radius: 45,
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 12),
            const Text(
              'Primary Putri Ardiva',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              '124240199',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const Text(
              'Pemilik Toko Alat Tulis',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            const Card(
              child: ListTile(
                leading: Icon(Icons.inventory_2, color: Colors.blue),
                title: Text('Toko Alat Tulis'),
                subtitle: Text('Kelola stok dan harga barang dagangan Anda.'),
              ),
            ),
            const Card(
              child: ListTile(
                leading: Icon(Icons.star, color: Colors.blue),
                title: Text('Barang Unggulan'),
                subtitle: Text('Pulpen, Buku Tulis, dan Pensil.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

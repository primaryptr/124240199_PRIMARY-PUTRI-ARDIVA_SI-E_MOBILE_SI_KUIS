import 'package:flutter/material.dart';

import '../models/stationery_item.dart';
import 'detail_page.dart';

// Stateful karena stok dan harga di daftar berubah setelah diedit di detail
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<StationeryItem> stationeryItems = StationeryItem.sampleData;

  Future<void> openDetail(StationeryItem stationery) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(stationeryItem: stationery),
      ),
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toko Alat Tulis'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: stationeryItems.length,
        itemBuilder: (context, index) {
          final stationery = stationeryItems[index];

          return Card(
            margin: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => openDetail(stationery),
              child: Row(
                children: [
                  // gambar alat tulis
                  Image.network(
                    stationery.imageUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox(
                        width: 100,
                        height: 100,
                        child: Icon(Icons.broken_image, color: Colors.grey),
                      );
                    },
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stationery.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            stationery.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 6),

                          // Rp dan harga (pcs)
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${stationery.stock} pcs tersedia',
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                'Rp ${stationery.formattedPrice} / pcs',
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

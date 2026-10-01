import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/stationery_item.dart';

// pake stateful
class DetailPage extends StatefulWidget {
  final StationeryItem stationeryItem;

  const DetailPage({super.key, required this.stationeryItem});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final descriptionController = TextEditingController();
  final stockController = TextEditingController();
  final priceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    descriptionController.text = widget.stationeryItem.description;
    stockController.text = widget.stationeryItem.stock.toString();
    priceController.text = widget.stationeryItem.price.toString();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    stockController.dispose();
    priceController.dispose();
    super.dispose();
  }

  void saveItem() {
    final item = widget.stationeryItem;

    item.description = descriptionController.text;

    item.stock = int.tryParse(stockController.text) ?? item.stock;
    item.price = int.tryParse(priceController.text) ?? item.price;

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Data barang disimpan')));

    Navigator.pop(context); // balik ke beranda
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.stationeryItem;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                item.imageUrl,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    height: 220,
                    child: Center(child: Icon(Icons.broken_image, size: 48)),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rp ${item.formattedPrice} / pcs',
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      controller: descriptionController,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: 'Deskripsi',
                        prefixIcon: Icon(Icons.description),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: stockController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        labelText: 'Stok tersedia (pcs)',
                        prefixIcon: Icon(Icons.inventory_2),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        labelText: 'Harga (Rp)',
                        prefixIcon: Icon(Icons.attach_money),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: saveItem,
                icon: const Icon(Icons.save),
                label: const Text('Simpan'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

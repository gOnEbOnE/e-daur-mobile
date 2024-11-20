import 'package:flutter/material.dart';
import 'package:mental_health_tracker_mobile/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final MaterialEntry product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.fields.nama,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text("Description: ${product.fields.deskripsi}"),
            const SizedBox(height: 8),
            Text("Price: ${product.fields.harga}"),
            const SizedBox(height: 8),
            Text("Rating: ${product.fields.rating}"),
          ],
        ),
      ),
    );
  }
}
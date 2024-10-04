import 'package:flutter/material.dart';

class SingleItemScreen extends StatelessWidget {
  final dynamic product;

  const SingleItemScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'http://localhost:8000/storage/${product['image']}',
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
              ),
              const SizedBox(height: 20),
              Text(
                product['name'],
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                "In Stock: ${product['qty_in_stock']}",
                style: const TextStyle(fontSize: 16, color: Colors.green),
              ),
              const SizedBox(height: 10),
              Text(
                "Original Price: \$${product['original_price']}",
                style: const TextStyle(fontSize: 18, decoration: TextDecoration.lineThrough),
              ),
              const SizedBox(height: 10),
              Text(
                "Sale Price: \$${product['sale_price']}",
                style: const TextStyle(fontSize: 22, color: Colors.red),
              ),
              const SizedBox(height: 20),
              const Text(
                "Specifications:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                product['specification'] ?? 'No specifications available.',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                "Gallery",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Image.network(
                'http://localhost:8000/storage/${product['gallery']}',
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:your_app_name/models/cart.dart'; // Adjust the import based on your project structure
import 'package:your_app_name/models/product.dart'; // Import the Product model if needed

class CartScreen extends StatelessWidget {
  final Cart cart; // The Cart object containing the products in the cart

  CartScreen({Key? key, required this.cart}) : super(key: key); // Constructor accepting the cart

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: cart.products.isEmpty
          ? Center(child: Text('Your Cart is empty')) // Display message if the cart is empty
          : ListView.builder(
              itemCount: cart.products.length,
              itemBuilder: (context, index) {
                final product = cart.products[index];
                return ListTile(
                  title: Text(product.name), // Display product name
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'), // Display product price
                  trailing: Text('Qty: ${cart.quantity}'), // Display quantity (you might want to store it in the Product model or Cart)
                );
              },
            ),
    );
  }
}

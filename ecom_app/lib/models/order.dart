import 'package:flutter/material.dart';

class Order {
  final String id; // Unique identifier for the order
  final String productId; // ID of the product ordered
  final String userId; // ID of the user who placed the order
  final int quantity; // Quantity of the product ordered
  final double totalPrice; // Total price of the order
  final DateTime orderDate; // Date the order was placed
  final String status; // Status of the order (e.g., pending, shipped, delivered)

  Order({
    required this.id,
    required this.productId,
    required this.userId,
    required this.quantity,
    required this.totalPrice,
    required this.orderDate,
    required this.status,
  });

  // Factory method to create an Order from a JSON object
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as String,
      productId: json['productId'] as String,
      userId: json['userId'] as String,
      quantity: json['quantity'] as int,
      totalPrice: (json['totalPrice'] as num).toDouble(),
      orderDate: DateTime.parse(json['orderDate'] as String),
      status: json['status'] as String,
    );
  }

  // Method to convert an Order to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'userId': userId,
      'quantity': quantity,
      'totalPrice': totalPrice,
      'orderDate': orderDate.toIso8601String(),
      'status': status,
    };
  }
}

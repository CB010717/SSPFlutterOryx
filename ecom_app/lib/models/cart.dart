import 'product.dart';

class Cart {
  final int id;                   // Unique identifier for the cart
  final List<Product> products;   // List of products in the cart
  final int quantity;             // Quantity of each product

  Cart({
    required this.id,
    required this.products,
    required this.quantity,
  });

  // Method to calculate the total price of all products in the cart
  double get totalPrice {
    return products.fold(0, (total, product) => total + product.price * quantity);
  }

  // Method to add a product to the cart
  void addProduct(Product product) {
    products.add(product);
  }

  // Method to remove a product from the cart
  void removeProduct(Product product) {
    products.remove(product);
  }

  // Optional: Method to clear the cart
  void clearCart() {
    products.clear();
  }

  // Optional: Method to convert Cart to JSON for saving
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'products': products.map((product) => product.toJson()).toList(),
      'quantity': quantity,
    };
  }

  // Optional: Factory method to create a Cart instance from JSON
  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      products: (json['products'] as List)
          .map((productJson) => Product.fromJson(productJson))
          .toList(),
      quantity: json['quantity'],
    );
  }
}

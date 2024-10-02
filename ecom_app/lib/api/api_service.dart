import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:your_app_name/utils/constants.dart';
import 'package:your_app_name/models/product.dart';
import 'package:your_app_name/models/category.dart';
import 'package:your_app_name/models/cart_item.dart';
import 'package:your_app_name/models/order.dart';
import 'package:your_app_name/models/user.dart';

class ApiService {
  final http.Client client;

  ApiService({required this.client});

  // Home API
  Future<Map<String, dynamic>> fetchHomeData() async {
    final response = await client.get(Uri.parse('$BASE_URL/home'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load home data');
    }
  }

  Future<List<Offer>> fetchOffers() async {
    final response = await client.get(Uri.parse('$BASE_URL/home/offers'));

    if (response.statusCode == 200) {
      final List<dynamic> offersJson = json.decode(response.body);
      return offersJson.map((json) => Offer.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load offers');
    }
  }

  Future<List<Category>> fetchCategories() async {
    final response = await client.get(Uri.parse('$BASE_URL/home/categories'));

    if (response.statusCode == 200) {
      final List<dynamic> categoriesJson = json.decode(response.body);
      return categoriesJson.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  // Product API
  Future<List<Product>> fetchAllProducts() async {
    final response = await client.get(Uri.parse('$BASE_URL/products'));

    if (response.statusCode == 200) {
      final List<dynamic> productsJson = json.decode(response.body);
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<Product> fetchProductDetails(String slug) async {
    final response = await client.get(Uri.parse('$BASE_URL/products/$slug'));

    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load product details');
    }
  }

  // User API
  Future<User> fetchUserProfile(int userId) async {
    final response = await client.get(Uri.parse('$BASE_URL/users/profiles/$userId'));

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user profile');
    }
  }

  Future<void> updateUserProfile(int userId, Map<String, dynamic> data) async {
    final response = await client.put(
      Uri.parse('$BASE_URL/users/profiles/$userId'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update user profile');
    }
  }

  // Cart API
  Future<List<CartItem>> fetchCartItems(int userId) async {
    final response = await client.get(Uri.parse('$BASE_URL/users/cart/$userId'));

    if (response.statusCode == 200) {
      final List<dynamic> cartJson = json.decode(response.body);
      return cartJson.map((json) => CartItem.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cart items');
    }
  }

  Future<void> addToCart(int userId, int productId) async {
    final response = await client.get(Uri.parse('$BASE_URL/users/cart/add/$userId/$productId'));

    if (response.statusCode != 200) {
      throw Exception('Failed to add item to cart');
    }
  }

  Future<void> updateCart(int cartId, int productId, int qty) async {
    final response = await client.get(Uri.parse('$BASE_URL/users/cart/$cartId/$productId/$qty'));

    if (response.statusCode != 200) {
      throw Exception('Failed to update cart item');
    }
  }

  Future<void> removeCartItem(int cartId) async {
    final response = await client.delete(Uri.parse('$BASE_URL/users/cart/$cartId'));

    if (response.statusCode != 200) {
      throw Exception('Failed to remove item from cart');
    }
  }

  // Order API
  Future<Order> fetchOrderDetails(int orderId) async {
    final response = await client.get(Uri.parse('$BASE_URL/users/orders/$orderId'));

    if (response.statusCode == 200) {
      return Order.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load order details');
    }
  }

  Future<void> placeOrder(int userId, Map<String, dynamic> orderData) async {
    final response = await client.post(
      Uri.parse('$BASE_URL/users/checkout/$userId'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(orderData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to place order');
    }
  }

  // Search API
  Future<List<Product>> searchProducts(String keyword) async {
    final response = await client.get(Uri.parse('$BASE_URL/search/$keyword'));

    if (response.statusCode == 200) {
      final List<dynamic> searchResultsJson = json.decode(response.body);
      return searchResultsJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to search products');
    }
  }
}

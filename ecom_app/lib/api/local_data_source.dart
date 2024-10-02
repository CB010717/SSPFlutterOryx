import 'dart:convert';
import 'package:flutter/services.dart';

class LocalDataSource {
  /// Loads local products from a JSON file.
  Future<List<dynamic>> loadLocalProducts() async {
    try {
      // Load the JSON file from the assets
      final String response = await rootBundle.loadString('assets/json/local_products.json');
      // Decode the JSON response and return it
      return json.decode(response);
    } catch (e) {
      // Handle any errors that occur during the loading process
      print('Error loading local products: $e');
      return []; // Return an empty list in case of an error
    }
  }
}

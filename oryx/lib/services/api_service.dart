import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import '../models/offer_model.dart';

class ApiService {
  static const String baseUrl =
      "http://10.0.2.2:8000/api";

  // Method for user registration
  static Future<bool> registerUser(
      String name, String email, String password) async {
    final url = Uri.parse('$baseUrl/register');
    print("Registering user with email: $email");

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      print(
          "Register response status: ${response.statusCode}"); 
      if (response.statusCode == 201) {
        print("User registered successfully.");
        return true; // Success
      } else {
        print("Failed to register user. Status: ${response.statusCode}");
        return false; // Failure
      }
    } catch (e) {
      print("Error during registration: $e");
      return false;
    }
  }

  // Method for user login
  static Future<Map<String, dynamic>?> loginUser(
      String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    print("Logging in with email: $email"); // Debugging print

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      print("Login response status: ${response.statusCode}");
      print("Login response body: ${response.body}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        print("Login successful. Token: ${responseBody['access_token']}");
        return responseBody; // Successful login, return response
      } else {
        print("Login failed with status: ${response.statusCode}");
        return null; // Login failed
      }
    } catch (e) {
      print("Error during login: $e");
      return null; // Exception occurred
    }
  }

  // Method to fetch user details
  static Future<UserModel?> fetchUser(String email) async {
    final url = Uri.parse(
        '$baseUrl/user/$email'); // Adjust the endpoint as per your API
    print("Fetching user details for email: $email"); // Debugging print

    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
      });

      print("Fetch user response status: ${response.statusCode}");
      print("Fetch user response body: ${response.body}");

      if (response.statusCode == 200) {
        print("User details fetched successfully.");
        return UserModel.fromJson(
            jsonDecode(response.body)); // Parse JSON to UserModel
      } else {
        print("Failed to fetch user details. Status: ${response.statusCode}");
        return null; // Fetch failed
      }
    } catch (e) {
      print("Error fetching user details: $e");
      return null; // Exception occurred
    }
  }

  // Method to log out user
  static Future<bool> logoutUser(String token) async {
    final url = Uri.parse('$baseUrl/logout');
    print("Logging out user"); // Debugging print

    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      print("Logout response status: ${response.statusCode}");

      if (response.statusCode == 200) {
        print("User logged out successfully.");
        return true; // Success
      } else {
        print("Failed to log out user. Status: ${response.statusCode}");
        return false; // Failure
      }
    } catch (e) {
      print("Error during logout: $e");
      return false; // Exception occurred
    }
  }

// Function to fetch the products
  static Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }


  // Function to fetch offers
  static Future<List<dynamic>> fetchOffers() async {
    final response = await http.get(Uri.parse('$baseUrl/home/offers'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data['offers']; // Extract the 'offers' array from the response
    } else {
      throw Exception('Failed to load offers');
    }
  }


  // Fetch profile details
  static Future<Map<String, dynamic>> fetchProfile() async {
    final response = await http.get(Uri.parse('$baseUrl/site-settings'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['settings'];
    } else {
      throw Exception('Failed to load profile');
    }
  }
}

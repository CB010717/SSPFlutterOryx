import 'package:flutter/material.dart';
//import 'network_connection.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';
import '../services/network_connection.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback toggleTheme; // Add toggleTheme parameter
  final bool isDarkMode; // Add isDarkMode parameter

  const HomeScreen(
      {super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NetworkConnection _networkConnection;
  late StreamSubscription<ConnectivityResult> _subscription;
  String _connectionStatus = 'Checking network connection...';

  @override
  void initState() {
    super.initState();
    _networkConnection = NetworkConnection();

    // Listen for connectivity changes
    _subscription = _networkConnection.connectionStatusStream
        .listen((ConnectivityResult result) {
      setState(() {
        _connectionStatus = _getStatusMessage(result);
      });
    });

    // Check initial connectivity status
    _networkConnection.checkConnection().then((result) {
      setState(() {
        _connectionStatus = _getStatusMessage(result);
      });
    });
  }

  String _getStatusMessage(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        return 'Connected to Wi-Fi';
      case ConnectivityResult.mobile:
        return 'Connected to Mobile Data';
      case ConnectivityResult.none:
        return 'No Internet Connection';
      default:
        return 'Unknown Connection Status';
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    _networkConnection.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ORYX Skincare"),
        backgroundColor: const Color.fromARGB(255, 195, 57, 219),
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: widget.toggleTheme,
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to cart screen
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNetworkStatus(),
              const SizedBox(height: 20),
              _buildAdvertisementBanner(),
              const SizedBox(height: 20),
              const Text(
                "Shop by Categories",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              _buildCategorySection(),
              const SizedBox(height: 20),
              const Text(
                "Popular Products",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              _buildProductGrid(),
              const SizedBox(height: 20),
              _buildShopSummary(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNetworkStatus() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.yellow.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.network_check, color: Colors.black54),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              _connectionStatus,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdvertisementBanner() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: NetworkImage(
              'http://10.0.2.2:8000/storage/products/17278659911.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.4),
              Colors.black.withOpacity(0.1)
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: const Text(
          "Special Skincare Sale",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCategorySection() {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildCategoryItem(
              'Moisturizers', Icons.water_drop, Colors.blueAccent),
          _buildCategoryItem('Serums', Icons.opacity, Colors.pinkAccent),
          _buildCategoryItem('Cleansers', Icons.bubble_chart, Colors.orange),
          _buildCategoryItem('Masks', Icons.spa, Colors.green),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildProductGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 0.7,
      children: List.generate(4, (index) {
        return _buildProductItem();
      }),
    );
  }

  Widget _buildProductItem() {
    return GestureDetector(
      onTap: () {
        // Navigate to single product page
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.network(
                'http://10.0.2.2:8000/storage/products/17278659911.jpg',
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Skincare Product",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "\$25.00",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShopSummary() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.purple.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Why Choose ORYX Skincare?",
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "At ORYX, we provide top-notch skincare products designed to nourish your skin and keep it radiant. Our products are carefully crafted using the finest ingredients and backed by dermatological research.",
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Shop with us today and experience the best in skincare!",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

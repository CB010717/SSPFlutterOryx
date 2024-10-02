import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'), // Title of the AppBar
      ),
      body: Center(
        child: Text(
          'Welcome to the Home Screen', // Main content of the screen
          style: TextStyle(fontSize: 24), // Text style for better visibility
        ),
      ),
    );
  }
}

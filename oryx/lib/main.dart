import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // Starting splash screen
import 'screens/home_screen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ORYX App',
      theme: ThemeData(
        primarySwatch: Colors.purple, // Change your theme
      ),
      // Start with the splash screen
      home: const SplashScreen(), 
      // home: const HomeScreen(), 
    );
  }
}

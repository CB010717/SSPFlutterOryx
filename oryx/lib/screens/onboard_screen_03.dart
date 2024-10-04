import 'dart:async';
import 'package:flutter/material.dart';
import '../auth/login_screen.dart';

class OnboardScreen03 extends StatefulWidget {
  const OnboardScreen03({super.key});

  @override
  _OnboardScreen03State createState() => _OnboardScreen03State();
}

class _OnboardScreen03State extends State<OnboardScreen03> {
  bool showPopup = false;

  @override
  void initState() {
    super.initState();
    
    // Show the "Let's Start" popup after 3 seconds
    Timer(const Duration(seconds: 3), () {
      setState(() {
        showPopup = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top center image (image_03)
            Image.asset(
              'assets/images/image_03.png',
              height: 250.0,
              width: 250.0,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 30),

            // App Name (ORYX)
            const Text(
              "ORYX",
              style: TextStyle(
                fontSize: 42.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Description
            const Text(
              "ORYX Your online Skincare Store",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // "Let's Start" Popup
            if (showPopup)
              const Text(
                "Let's Start",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Highlighted in blue
                ),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 50),

            // Continue button
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                backgroundColor: Colors.purple, // Button background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Text(
                "Continue",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Button text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

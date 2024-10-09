import 'package:flutter/material.dart';
import 'onboard_screen_03.dart';

class OnboardScreen02 extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const OnboardScreen02({super.key, required this.toggleTheme, required this.isDarkMode});

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
            // Top center image (image_02)
            Image.asset(
              'assets/images/image_02.png',
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
              "We help people",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),

            // Continue button
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => OnboardScreen03(
                      toggleTheme: toggleTheme, // Pass the function
                      isDarkMode: isDarkMode,   // Pass the state
                    ),
                  ),
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

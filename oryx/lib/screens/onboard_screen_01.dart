import 'package:flutter/material.dart';
import 'onboard_screen_02.dart';

class OnboardScreen01 extends StatelessWidget {
  const OnboardScreen01({super.key});

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
            // Top center image (image_01)
            Image.asset(
              'assets/images/image_01.png',
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
              "Get your SkinCare",
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
                  MaterialPageRoute(builder: (_) => const OnboardScreen02()),
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

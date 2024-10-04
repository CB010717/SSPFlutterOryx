import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'onboard_screen_01.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    
    // Redirect to OnboardScreen01 after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const OnboardScreen01()), // Go to OnboardScreen01
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color of splash screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo (JPG)
            SizedBox(
              height: 150.0,
              width: 150.0,
              child: Image.asset('assets/images/logo.jpg'), // Replace with your JPG logo path
            ),
            const SizedBox(height: 20),
            
            // Display App Name (ORYX)
            const Text(
              "ORYX",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),
            
            // Loading bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 100,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 3000, // Matches with the timer duration (3 seconds)
                percent: 1.0,
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.blue, // Set your desired progress bar color
                backgroundColor: Colors.grey[300],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

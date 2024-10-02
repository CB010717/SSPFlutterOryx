import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    
    // Redirect to LoginScreen after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginScreen()),
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
            // Logo (GIF or SVG)
            Container(
              height: 150.0,
              width: 150.0,
              child: SvgPicture.asset('assets/oryx_logo.svg'), // Replace with your GIF logo path
            ),
            SizedBox(height: 20),
            
            // Display App Name (ORYX)
            Text(
              "ORYX",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 40),
            
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

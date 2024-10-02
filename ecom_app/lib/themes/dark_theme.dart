import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark, // Set the brightness to dark
  primaryColor: Colors.black, // Main color of the app
  accentColor: Colors.grey, // Accent color for widgets
  scaffoldBackgroundColor: Colors.black87, // Background color for scaffold
  appBarTheme: AppBarTheme(
    color: Colors.black, // AppBar color
    iconTheme: IconThemeData(color: Colors.white), // Icon color in AppBar
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20), // AppBar title style
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.grey[800], // Default button color
    textTheme: ButtonTextTheme.primary, // Text color for buttons
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Colors.white, fontSize: 16), // Default body text style
    bodyText2: TextStyle(color: Colors.white54, fontSize: 14), // Secondary text style
    headline1: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold), // Headline style
    caption: TextStyle(color: Colors.white38, fontSize: 12), // Caption style
  ),
  cardColor: Colors.grey[850], // Card color
  dividerColor: Colors.grey[700], // Divider color
  iconTheme: IconThemeData(color: Colors.white), // Icon color
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.black, // Background color for BottomNavigationBar
    selectedItemColor: Colors.blueAccent, // Selected item color
    unselectedItemColor: Colors.grey, // Unselected item color
  ),
);

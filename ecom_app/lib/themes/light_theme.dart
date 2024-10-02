import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue, // Main color of the app
  accentColor: Colors.blueAccent, // Accent color for widgets
  scaffoldBackgroundColor: Colors.white, // Background color for scaffold
  appBarTheme: AppBarTheme(
    color: Colors.blue, // AppBar color
    iconTheme: IconThemeData(color: Colors.white), // Icon color in AppBar
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20), // AppBar title style
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.blue, // Default button color
    textTheme: ButtonTextTheme.primary, // Text color for buttons
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Colors.black, fontSize: 16), // Default body text style
    bodyText2: TextStyle(color: Colors.black54, fontSize: 14), // Secondary text style
    headline1: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold), // Headline style
    caption: TextStyle(color: Colors.black38, fontSize: 12), // Caption style
  ),
  cardColor: Colors.white, // Card color
  dividerColor: Colors.grey[300], // Divider color
  iconTheme: IconThemeData(color: Colors.black), // Icon color
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white, // Background color for BottomNavigationBar
    selectedItemColor: Colors.blue, // Selected item color
    unselectedItemColor: Colors.grey, // Unselected item color
  ),
  // Add more theme configurations as needed
);

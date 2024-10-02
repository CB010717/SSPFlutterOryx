import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text; // The text to display on the button
  final VoidCallback onPressed; // Callback function when the button is pressed

  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, // Assign the callback function
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16, // Adjust font size as needed
          fontWeight: FontWeight.bold, // Make the text bold
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24), // Padding for button
        primary: Colors.blue, // Background color
        onPrimary: Colors.white, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex; // Track the current selected index
  final ValueChanged<int> onTap; // Callback function for when an item is tapped

  BottomNavigation({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list), // Icon for Items
          label: 'Items',
        ),
      ],
      currentIndex: currentIndex, // Set the current index
      onTap: onTap, // Handle navigation when an item is tapped
      type: BottomNavigationBarType.fixed, // Use a fixed type for the bottom navigation bar
      selectedItemColor: Colors.blue, // Color for selected item
      unselectedItemColor: Colors.grey, // Color for unselected items
      showUnselectedLabels: true, // Show labels for unselected items
      showSelectedLabels: true, // Show labels for selected items
    );
  }
}

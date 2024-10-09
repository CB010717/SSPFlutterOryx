import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/product_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/offers_screen.dart';

class BottomNavigation extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const BottomNavigation({super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(toggleTheme: widget.toggleTheme, isDarkMode: widget.isDarkMode),
      const ProductScreen(),
      const SettingsScreen(),
      const OffersScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Offers',
          ),
        ],
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

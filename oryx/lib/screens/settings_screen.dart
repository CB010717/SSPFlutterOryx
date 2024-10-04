import 'package:flutter/material.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';
import 'location_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // User avatar section
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/user_avatar.jpg'),
            ),
            const SizedBox(height: 20),

            // Display the user name
            const Text(
              "John Doe",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Buttons for Settings options
            _buildSettingsButton(
              icon: Icons.notifications_outlined,
              title: "Notifications",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const NotificationScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildSettingsButton(
              icon: Icons.person_outline,
              title: "Profile",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildSettingsButton(
              icon: Icons.location_on_outlined,
              title: "Location",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LocationScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildSettingsButton(
              icon: Icons.logout,
              title: "Logout",
              onPressed: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create Settings buttons
  Widget _buildSettingsButton({
    required IconData icon,
    required String title,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        backgroundColor: Colors.purple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 30, color: Colors.white),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.white),
        ],
      ),
    );
  }
}

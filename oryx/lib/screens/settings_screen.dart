import 'package:flutter/material.dart';
import '../services/api_service.dart'; // Import the ApiService if you want to fetch settings data

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Future<Map<String, dynamic>> _settingsData;

  @override
  void initState() {
    super.initState();
    _settingsData = ApiService.fetchProfile(); // Replace with the proper fetch call if necessary
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _settingsData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load settings data.'));
          } else if (snapshot.hasData) {
            final settings = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Display the logo if available
                  if (settings['logo'] != null)
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(settings['logo']),
                    ),
                  const SizedBox(height: 20),
                  // Display the name
                  Text(
                    settings['name'] ?? 'N/A',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Display the email
                  _buildSettingsInfo(
                    icon: Icons.email_outlined,
                    title: 'Email',
                    content: settings['email'] ?? 'N/A',
                  ),
                  const SizedBox(height: 20),
                  // Display the phone
                  _buildSettingsInfo(
                    icon: Icons.phone,
                    title: 'Phone',
                    content: settings['phone'] ?? 'N/A',
                  ),
                  const SizedBox(height: 20),
                  // Display the address
                  _buildSettingsInfo(
                    icon: Icons.location_on_outlined,
                    title: 'Address',
                    content: settings['address'] ?? 'N/A',
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No settings data available.'));
          }
        },
      ),
    );
  }

  // Helper method to display settings info
  Widget _buildSettingsInfo({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 30, color: Colors.purple),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                content,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

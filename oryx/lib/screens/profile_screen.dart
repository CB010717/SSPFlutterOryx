import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<Map<String, dynamic>> _profileData;

  @override
  void initState() {
    super.initState();
    _profileData = ApiService.fetchProfile(); // Fetch the profile data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _profileData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load profile data.'));
          } else if (snapshot.hasData) {
            final profile = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Display the logo
                  if (profile['logo'] != null)
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(profile['logo']),
                    ),
                  const SizedBox(height: 20),
                  // Display the name
                  Text(
                    profile['name'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Display the slogan
                  Text(
                    profile['slogan'] ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Display the email, phone, and address
                  _buildProfileInfo(
                    icon: Icons.email_outlined,
                    title: 'Email',
                    content: profile['email'] ?? 'N/A',
                  ),
                  const SizedBox(height: 20),
                  _buildProfileInfo(
                    icon: Icons.phone,
                    title: 'Phone',
                    content: profile['phone'] ?? 'N/A',
                  ),
                  const SizedBox(height: 20),
                  _buildProfileInfo(
                    icon: Icons.location_on_outlined,
                    title: 'Address',
                    content: profile['address'] ?? 'N/A',
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No profile data available.'));
          }
        },
      ),
    );
  }

  // Widget to build individual profile info with icons
  Widget _buildProfileInfo({
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

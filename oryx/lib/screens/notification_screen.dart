import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications = [
      {
        'title': 'Order Shipped',
        'description': 'Your order #1234 has been shipped.',
        'time': '2 mins ago',
      },
      {
        'title': 'Discount Alert',
        'description': 'New discounts available for skin care products!',
        'time': '10 mins ago',
      },
      {
        'title': 'Profile Updated',
        'description': 'Your profile information has been successfully updated.',
        'time': '30 mins ago',
      },
      {
        'title': 'Payment Received',
        'description': 'Your payment for order #5678 has been received.',
        'time': '1 hour ago',
      },
      {
        'title': 'New Message',
        'description': 'You have a new message from customer support.',
        'time': '2 hours ago',
      },
      {
        'title': 'Order Delivered',
        'description': 'Your order #7890 has been delivered.',
        'time': 'Yesterday',
      },
      {
        'title': 'Password Changed',
        'description': 'Your account password has been successfully changed.',
        'time': '2 days ago',
      },
      {
        'title': 'New Skin Care Tips',
        'description': 'Check out our latest blog post on skin care tips.',
        'time': '3 days ago',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return _buildNotificationCard(notifications[index]);
        },
      ),
    );
  }

  // Helper function to build each notification card
  Widget _buildNotificationCard(Map<String, String> notification) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: _getNotificationIcon(notification['title']!),
        title: Text(
          notification['title']!,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8.0),
            Text(
              notification['description']!,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 10),
            Text(
              notification['time']!,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey[400]),
      ),
    );
  }

  // Function to get different icons based on notification title
  Icon _getNotificationIcon(String title) {
    if (title.contains('Order')) {
      return const Icon(Icons.shopping_cart, size: 30, color: Colors.purple);
    } else if (title.contains('Discount') || title.contains('Tips')) {
      return const Icon(Icons.local_offer, size: 30, color: Colors.purple);
    } else if (title.contains('Message')) {
      return const Icon(Icons.message, size: 30, color: Colors.purple);
    } else if (title.contains('Profile') || title.contains('Password')) {
      return const Icon(Icons.person, size: 30, color: Colors.purple);
    } else if (title.contains('Payment')) {
      return const Icon(Icons.payment, size: 30, color: Colors.purple);
    } else {
      return const Icon(Icons.notifications, size: 30, color: Colors.purple);
    }
  }
}

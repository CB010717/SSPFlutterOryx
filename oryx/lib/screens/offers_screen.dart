import 'package:flutter/material.dart';
import '../services/api_service.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  late Future<List<dynamic>> _offersList;

  @override
  void initState() {
    super.initState();
    _offersList = ApiService.fetchOffers(); // Fetch offers from API
  }

  String formatDiscount(dynamic offer) {
    if (offer['type'] == 'Decimal') {
      return 'Drop \$${offer['discount']}';
    } else if (offer['type'] == 'Percentage') {
      return 'Drop ${offer['discount']}%';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offers'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _offersList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load offers.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No offers available.'));
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final offer = snapshot.data![index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Image.network(
                      offer['image'],
                      fit: BoxFit.cover,
                      width: 60,
                      height: 60,
                    ),
                    title: Text(
                      offer['name'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      formatDiscount(offer),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.redAccent,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.info_outline),
                      onPressed: () {
                        _showOfferDetails(context, offer);
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  // Function to show offer details in a dialog
  void _showOfferDetails(BuildContext context, dynamic offer) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(offer['name']),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(offer['image']),
              const SizedBox(height: 10),
              Text("Title: ${offer['title']}"),
              const SizedBox(height: 5),
              Text("Type: ${offer['type']}"),
              const SizedBox(height: 5),
              Text("Discount: ${formatDiscount(offer)}"),
              const SizedBox(height: 5),
              Text("Expires on: ${offer['expire_date']}"),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

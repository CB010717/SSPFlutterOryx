import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrientationScreen extends StatelessWidget {
  const OrientationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lock the orientation to allow both portrait and landscape
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Orientation Screen"),
      ),
      body: Center(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  orientation == Orientation.portrait
                      ? "Current Orientation: Portrait"
                      : "Current Orientation: Landscape",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate back or perform any action
                    Navigator.of(context).pop();
                  },
                  child: const Text("Go Back"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

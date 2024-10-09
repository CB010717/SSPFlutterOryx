import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GyroscopeScreen extends StatefulWidget {
  const GyroscopeScreen({super.key});

  @override
  _GyroscopeScreenState createState() => _GyroscopeScreenState();
}

class _GyroscopeScreenState extends State<GyroscopeScreen> {
  String _gyroscopeValues = "X: 0.0, Y: 0.0, Z: 0.0";

  @override
  void initState() {
    super.initState();
    _getGyroscopeData();
  }

  void _getGyroscopeData() {
    // Listen to gyroscope events
    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeValues = "X: ${event.x}, Y: ${event.y}, Z: ${event.z}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gyroscope"),
      ),
      body: Center(
        child: Text(
          _gyroscopeValues,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

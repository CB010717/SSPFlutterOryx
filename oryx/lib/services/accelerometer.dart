import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class AccelerometerScreen extends StatefulWidget {
  const AccelerometerScreen({Key? key}) : super(key: key);

  @override
  _AccelerometerScreenState createState() => _AccelerometerScreenState();
}

class _AccelerometerScreenState extends State<AccelerometerScreen> {
  String _accelerometerValues = "X: 0.0, Y: 0.0, Z: 0.0";

  @override
  void initState() {
    super.initState();
    _getAccelerometerData();
  }

  void _getAccelerometerData() {
    // Listen to accelerometer events
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerValues = "X: ${event.x}, Y: ${event.y}, Z: ${event.z}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Accelerometer"),
      ),
      body: Center(
        child: Text(
          _accelerometerValues,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

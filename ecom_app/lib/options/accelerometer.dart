import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class AccelerometerSensor extends StatefulWidget {
  @override
  _AccelerometerSensorState createState() => _AccelerometerSensorState();
}

class _AccelerometerSensorState extends State<AccelerometerSensor> {
  List<double>? _accelerometerValues;

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerValues = [event.x, event.y, event.z];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Accelerometer')),
      body: Center(
        child: Text(_accelerometerValues != null
            ? 'X: ${_accelerometerValues![0]}, Y: ${_accelerometerValues![1]}, Z: ${_accelerometerValues![2]}'
            : 'Loading...'),
      ),
    );
  }
}

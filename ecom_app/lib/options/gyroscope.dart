import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GyroscopeSensor extends StatefulWidget {
  @override
  _GyroscopeSensorState createState() => _GyroscopeSensorState();
}

class _GyroscopeSensorState extends State<GyroscopeSensor> {
  List<double>? _gyroscopeValues;

  @override
  void initState() {
    super.initState();
    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeValues = [event.x, event.y, event.z];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gyroscope')),
      body: Center(
        child: Text(_gyroscopeValues != null
            ? 'X: ${_gyroscopeValues![0]}, Y: ${_gyroscopeValues![1]}, Z: ${_gyroscopeValues![2]}'
            : 'Loading...'),
      ),
    );
  }
}

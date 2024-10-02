import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

class OrientationSensor extends StatefulWidget {
  @override
  _OrientationSensorState createState() => _OrientationSensorState();
}

class _OrientationSensorState extends State<OrientationSensor> {
  double? _heading;

  @override
  void initState() {
    super.initState();
    FlutterCompass.events!.listen((double heading) {
      setState(() {
        _heading = heading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Orientation')),
      body: Center(
        child: Text(_heading != null
            ? 'Heading: ${_heading!.toStringAsFixed(2)}°'
            : 'Loading...'),
      ),
    );
  }
}

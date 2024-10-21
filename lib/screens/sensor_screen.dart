import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorScreen extends StatefulWidget {
  @override
  _SensorScreenState createState() => _SensorScreenState();
}

class _SensorScreenState extends State<SensorScreen> {
  // Variables para almacenar datos del acelerómetro
  double _accelerometerX = 0.0;
  double _accelerometerY = 0.0;
  double _accelerometerZ = 0.0;

  // Variables para almacenar datos del giroscopio
  double _gyroscopeX = 0.0;
  double _gyroscopeY = 0.0;
  double _gyroscopeZ = 0.0;

  // Variables para almacenar datos del magnetómetro
  double _magnetometerX = 0.0;
  double _magnetometerY = 0.0;
  double _magnetometerZ = 0.0;

  @override
  void initState() {
    super.initState();

    // Escuchar los cambios del acelerómetro
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerX = event.x;
        _accelerometerY = event.y;
        _accelerometerZ = event.z;
      });
    });

    // Escuchar los cambios del giroscopio
    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeX = event.x;
        _gyroscopeY = event.y;
        _gyroscopeZ = event.z;
      });
    });

    // Escuchar los cambios del magnetómetro
    magnetometerEvents.listen((MagnetometerEvent event) {
      setState(() {
        _magnetometerX = event.x;
        _magnetometerY = event.y;
        _magnetometerZ = event.z;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Datos de los Sensores")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Datos del acelerómetro
            Text('Acelerómetro'),
            Text('X: $_accelerometerX'),
            Text('Y: $_accelerometerY'),
            Text('Z: $_accelerometerZ'),
            SizedBox(height: 20),

            // Datos del giroscopio
            Text('Giroscopio'),
            Text('X: $_gyroscopeX'),
            Text('Y: $_gyroscopeY'),
            Text('Z: $_gyroscopeZ'),
            SizedBox(height: 20),

            // Datos del magnetómetro
            Text('Magnetómetro'),
            Text('X: $_magnetometerX'),
            Text('Y: $_magnetometerY'),
            Text('Z: $_magnetometerZ'),
          ],
        ),
      ),
    );
  }
}

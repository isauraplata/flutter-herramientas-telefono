// lib/screens/gps_screen.dart
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GPSScreen extends StatefulWidget {
  @override
  _GPSScreenState createState() => _GPSScreenState();
}

class _GPSScreenState extends State<GPSScreen> {
  Position? _position;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    // Lógica para obtener la ubicación GPS
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ubicación GPS")),
      body: Center(
        child: _position != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Latitud: ${_position?.latitude}"),
                  Text("Longitud: ${_position?.longitude}"),
                ],
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}

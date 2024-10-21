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
  bool serviceEnabled;
  LocationPermission permission;

  // Verifica si el servicio de GPS está habilitado
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Servicio de GPS deshabilitado
    return;
  }

  // Verifica los permisos de ubicación
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permisos denegados, no podemos proceder
      return;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permisos denegados permanentemente
    return;
  }

  // Obtener la posición actual
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);

  setState(() {
    _position = position;
  });
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
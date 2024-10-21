// lib/main.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// Importar los screens
import 'screens/gps_screen.dart';
import 'screens/qr_screen.dart';
import 'screens/sensor_screen.dart';
import 'screens/speech_to_text_screen.dart';
import 'screens/text_to_speech_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Datos del Alumno")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Nombre: Isaura Valeria Plata Rojas"),
          Text("Matrícula: 221216"),
          // Enlace al repositorio
          TextButton(
            onPressed: () async {
              const url = 'https://github.com/isauraplata/flutter-herramientas-telefono';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'No se pudo abrir $url';
              }
            },
            child: Text("Repositorio del Proyecto"),
          ),
          // Enlace a las otras vistas
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => GPSScreen()));
            },
            child: Text("Ver Ubicación GPS"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => QRScreen()));
            },
            child: Text("Leer Matrícula desde QR"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SensorScreen()));
            },
            child: Text("Ver Sensores"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SpeechToTextScreen()));
            },
            child: Text("Grabación de Audio"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TextToSpeechScreen()));
            },
            child: Text("Reproducción de Texto"),
          ),
        ],
      ),
    );
  }
}

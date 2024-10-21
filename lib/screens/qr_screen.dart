// lib/screens/qr_screen.dart
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Leer QR de Matrícula")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Genera el código QR basado en una cadena de texto
            QrImageView(
              data: "123456", // Aquí la matrícula o información que quieres codificar
              version: QrVersions.auto,
              size: 200,
            ),
            SizedBox(height: 20),
            Text("Escanee su Matrícula"),
          ],
        ),
      ),
    );
  }
}

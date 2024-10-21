import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

enum TtsState { playing, stopped, paused, continued }

class TextToSpeechScreen extends StatefulWidget {
  @override
  _TextToSpeechScreenState createState() => _TextToSpeechScreenState();
}

class _TextToSpeechScreenState extends State<TextToSpeechScreen> {
  final FlutterTts flutterTts = FlutterTts();
  String _text = "Escribe algo para convertir en voz";
  TtsState ttsState = TtsState.stopped;
  String _debugInfo = "";

  @override
  void initState() {
    super.initState();
    _configureTts();
  }

  void _configureTts() async {
    try {
      await flutterTts.setLanguage("es-ES");
      await flutterTts.setSpeechRate(0.5);
      await flutterTts.setVolume(1.0);
      await flutterTts.setPitch(1.0);

      bool isLanguageAvailable = await flutterTts.isLanguageAvailable("es-ES");
      setState(() {
        _debugInfo += "Idioma disponible: $isLanguageAvailable\n";
      });

      flutterTts.setStartHandler(() {
        setState(() {
          print("Playing");
          _debugInfo += "Reproducción iniciada\n";
          ttsState = TtsState.playing;
        });
      });

      flutterTts.setCompletionHandler(() {
        setState(() {
          print("Complete");
          _debugInfo += "Reproducción completada\n";
          ttsState = TtsState.stopped;
        });
      });

      flutterTts.setErrorHandler((msg) {
        setState(() {
          print("Error: $msg");
          _debugInfo += "Error: $msg\n";
          ttsState = TtsState.stopped;
        });
      });

      _debugInfo += "Configuración completada\n";
    } catch (e) {
      setState(() {
        _debugInfo += "Error en configuración: $e\n";
      });
    }
  }

  Future<void> _speak() async {
  if (_text.isNotEmpty) {
    try {
      var result = await flutterTts.speak(_text);
      if (result == 1) { // Verifica si el resultado es exitoso
        setState(() {
          _debugInfo += "Texto reproducido correctamente\n";
        });
      }
    } catch (e) {
      setState(() {
        _debugInfo += "Error al hablar: $e\n";
      });
    }
  }
}

  Future<void> _stop() async {
    try {
      var result = await flutterTts.stop();
      if (result == 1) setState(() => ttsState = TtsState.stopped);
      setState(() {
        _debugInfo += "Resultado de stop(): $result\n";
      });
    } catch (e) {
      setState(() {
        _debugInfo += "Error al detener: $e\n";
      });
    }
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Texto a Voz")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (val) {
                setState(() {
                  _text = val;
                });
              },
              decoration: InputDecoration(labelText: "Introduce el texto"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _speak,
              child: Text("Reproducir"),
            ),
            ElevatedButton(
              onPressed: _stop,
              child: Text("Detener"),
            ),
            SizedBox(height: 20),
            Text("Estado: ${ttsState.toString().split('.').last}"),
            Expanded(
              child: SingleChildScrollView(
                child: Text(_debugInfo),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
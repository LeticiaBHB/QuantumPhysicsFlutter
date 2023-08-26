import 'package:flutter/material.dart';
import 'package:quantum_shuffling/Quantum_retrocausality.dart';
import 'package:quantum_shuffling/Quantum_shuffling.dart';

void main() {
  ErrorWidget.builder = (details) => MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.redAccent,
          body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.warning_amber_sharp,
                    color: Colors.white, size: 100),
                const SizedBox(height: 20),
                SelectableText(
                  details.exception.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selectable Text Example',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text(
          'QUANTUM PHYSICS',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: ClipOval(
                child: Container(
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/logo.jpeg',
                      fit: BoxFit.cover, filterQuality: FilterQuality.low),
                ),
              ),
            ),SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Quantum_Shuffling()),
                );
              },
              child: Text('Quantum Shuffling'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuantumRetrocausality()),
                );
              },
              child: Text('Quantum Retrocausality'),
            ),

          ],
        ),
      ),
    );
  }
}


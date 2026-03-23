import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget buildButton(IconData icon, String text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(height: 5),
        Text(text, style: const TextStyle(color: Colors.blue))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Exercício 2")),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton(Icons.call, "CALL"),
              buildButton(Icons.near_me, "ROUTE"),
              buildButton(Icons.share, "SHARE"),
            ],
          ),
        ),
      ),
    );
  }
}
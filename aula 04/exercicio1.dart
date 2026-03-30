import 'package:flutter/material.dart';

void main() => runApp(const Exercicio1App());

class Exercicio1App extends StatelessWidget {
  const Exercicio1App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFE0E0E0),
      ),
      home: const ExercicioPage(),
    );
  }
}

class ExercicioPage extends StatelessWidget {
  const ExercicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            // Widget azul
            Container(
              width: 160,
              height: 100,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                border: Border.all(color: Colors.orange, width: 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() => runApp(const Exercicio2App());

class Exercicio2App extends StatelessWidget {
  const Exercicio2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFE0E0E0), 
      ),
      home: const SobrescritaPage(),
    );
  }
}

class SobrescritaPage extends StatelessWidget {
  const SobrescritaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Widget', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Container(
                  width: 140,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    border: Border.all(color: Colors.orange, width: 1),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 40),
            
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFBDBDBD),
                border: Border.all(color: Colors.black54),
              ),
              child: Theme(
                data: Theme.of(context).copyWith(primaryColor: Colors.yellow),
                child: Builder(
                  builder: (context) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('ThemeData             ', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      const Text('Widget', style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Container(
                        width: 140,
                        height: 100,
                        decoration: BoxDecoration(
                          
                          color: Theme.of(context).primaryColor,
                          border: Border.all(color: Colors.orange, width: 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HomePage()));

const Color pink =  Color.fromARGB(255, 244, 54, 165);
const Color blue = Color.fromARGB(255, 133, 167, 206);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  
  final List<Widget> _examples = [
    const Example1(),
    const Example8(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("exercicio 3: exemplo ${_currentIndex == 0 ? 1 : 8}")),
     
      body: _examples[_currentIndex],
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.swap_horiz),
        onPressed: () => setState(() => _currentIndex = _currentIndex == 0 ? 1 : 0),
      ),
    );
  }
}

// --- Exemplo 1 ---
class Example1 extends StatelessWidget {
  const Example1({super.key});
  @override
  Widget build(BuildContext context) => Container(color: const Color.fromARGB(255, 244, 54, 165));
}

// --- Exemplo 8 ---
class Example8 extends StatelessWidget {
  const Example8({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: const Color.fromARGB(255, 244, 54, 165),
        child: Container(color: const Color.fromARGB(255, 133, 167, 206), width: 30, height: 30),
      ),
    );
  }
}
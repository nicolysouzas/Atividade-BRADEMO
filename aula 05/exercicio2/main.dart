import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     
      theme: ThemeData.dark(), 
      home: const ResponsiveLayoutDemo(),
    );
  }
}

class ResponsiveLayoutDemo extends StatelessWidget {
  const ResponsiveLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsive Layouts"),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return _buildLandscapeLayout();
          } else {
            return _buildPortraitLayout();
          }
        },
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Text("Cheetah Coding", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton("BUTTON 1"),
            const SizedBox(width: 20),
            _buildButton("BUTTON 2"),
          ],
        ),
        const SizedBox(height: 30),
        Expanded(child: _buildList()),
      ],
    );
  }


  Widget _buildLandscapeLayout() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Cheetah Coding", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              _buildButton("BUTTON 1"),
              const SizedBox(height: 10),
              _buildButton("BUTTON 2"),
            ],
          ),
        ),
        // Lado Direito: Lista
        Expanded(
          flex: 1,
          child: _buildList(),
        ),
      ],
    );
  }


  Widget _buildButton(String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        minimumSize: const Size(120, 40),
      ),
      onPressed: () {},
      child: Text(text),
    );
  }

  Widget _buildList() {
    return ListView(
      children: const [
        ListTile(title: Text("Dart", textAlign: TextAlign.center), tileColor: Colors.black12),
        ListTile(title: Text("JavaScript", textAlign: TextAlign.center), tileColor: Colors.black12),
        ListTile(title: Text("PHP", textAlign: TextAlign.center), tileColor: Colors.black12),
        ListTile(title: Text("C++", textAlign: TextAlign.center), tileColor: Colors.black12),
      ],
    );
  }
}
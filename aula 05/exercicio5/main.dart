import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: BottomBarWithFabPage()));

class BottomBarWithFabPage extends StatefulWidget {
  const BottomBarWithFabPage({super.key});

  @override
  State<BottomBarWithFabPage> createState() => _BottomBarWithFabPageState();
}

class _BottomBarWithFabPageState extends State<BottomBarWithFabPage> {
  bool _showMenu = false;
  int _selectedIndex = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BottomAppBar with FAB"), backgroundColor: Colors.blue,),
      body: Stack(
        children: [
          Center(child: Text("TAB: ${_selectedIndex + 1}", style: const TextStyle(fontSize: 24))),
          if (_showMenu)
            Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  _buildFloatingMenuItem(Icons.message),
                  _buildFloatingMenuItem(Icons.mail),
                  _buildFloatingMenuItem(Icons.phone),
                ],
              ),
            ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(_showMenu ? Icons.close : Icons.add),
        onPressed: () {
          setState(() {
            _showMenu = !_showMenu;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
            IconButton(icon: const Icon(Icons.layers), onPressed: () {}),
            const SizedBox(width: 40), // Espaço para o FAB
            IconButton(icon: const Icon(Icons.grid_view), onPressed: () {}),
            IconButton(icon: const Icon(Icons.info), onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingMenuItem(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: FloatingActionButton.small(
        onPressed: () => print("Ação do ícone"),
        child: Icon(icon),
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: FlutterFormDemo()));
}

class FlutterFormDemo extends StatefulWidget {
  const FlutterFormDemo({super.key});

  @override
  State<FlutterFormDemo> createState() => _FlutterFormDemoState();
}

class _FlutterFormDemoState extends State<FlutterFormDemo> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();

  void _submitForm() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Nome: ${_nameController.text}, Phone: ${_phoneController.text}, DOB: ${_dobController.text}",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Form Demo"), backgroundColor: Colors.blue,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo Name
            Row(
              children: [
                const Icon(Icons.person),
                const SizedBox(width: 10),
                Expanded(child: TextFormField(controller: _nameController, decoration: const InputDecoration(labelText: 'Name'))),
              ],
            ),
            // Campo Phone
            Row(
              children: [
                const Icon(Icons.phone),
                const SizedBox(width: 10),
                Expanded(child: TextFormField(controller: _phoneController, decoration: const InputDecoration(labelText: 'Phone'))),
              ],
            ),
            // Campo DOB
            Row(
              children: [
                const Icon(Icons.calendar_today),
                const SizedBox(width: 10),
                Expanded(child: TextFormField(controller: _dobController, decoration: const InputDecoration(labelText: 'Dob'))),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
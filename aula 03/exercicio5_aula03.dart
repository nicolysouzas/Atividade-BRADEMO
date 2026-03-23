import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget buildButton(IconData icon, String text) {
    return Column(
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
      home: Scaffold(
        appBar: AppBar(title: const Text("Exercício 5")),
        body: ListView(
          children: [
            Image.network(
              "data:image/jpeg;base64,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",
              height: 240,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Oeschinen Lake Campground",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Kandersteg, Switzerland",
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                  const Icon(Icons.star, color: Colors.red),
                  const Text("41"),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildButton(Icons.call, "CALL"),
                buildButton(Icons.near_me, "ROUTE"),
                buildButton(Icons.share, "SHARE"),
              ],
            ),

            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps...",
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
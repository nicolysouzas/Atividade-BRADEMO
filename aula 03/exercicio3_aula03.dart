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
      home: Scaffold(
        appBar: AppBar(
  backgroundColor: Colors.blue,
  title: const Text(
    "Stack & Positioned Widget",
    style: TextStyle(color: Colors.white),
  ),
),
        body: Center(
          child: Stack(
            children: [

              // GREEN
              Positioned(
                top: 15,
                left: 15,
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.green,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Green",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),

              // RED
              Positioned(
                top: 50,
                left: 50,
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Red",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),

              // PURPLE
              Positioned(
                top: 90,
                left: 90,
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.purple,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Purple",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
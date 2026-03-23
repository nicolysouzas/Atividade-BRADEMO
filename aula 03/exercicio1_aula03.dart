import 'package:flutter/material.dart';

void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: true,
home: Scaffold(
appBar: AppBar(
backgroundColor: Colors.green,
title: const Text('Flutter is Fun!',style: TextStyle(color: Colors.white)),
),
body: Container(
  padding: EdgeInsets.all(150),
child: Container(
width: 200,
height: 200,
decoration: BoxDecoration(
color: Colors.red,
borderRadius: BorderRadius.circular(12),
),
child: const Column(
mainAxisAlignment: MainAxisAlignment.start,
children: [
  Text(
  'Hi mom 🐣',
  style: TextStyle(fontSize: 25),
),
],
),
),
),
),
);
}
}
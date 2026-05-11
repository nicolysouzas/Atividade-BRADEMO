
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HTTP Requests',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String resultado = '';

  // GET único
  Future<void> getPost() async {
    var url = Uri.https(
      'jsonplaceholder.typicode.com',
      'posts/1',
    );

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    setState(() {
      resultado = response.body;
    });
  }

  // GET lista
  Future<void> getLista() async {
    var url = Uri.https(
      'jsonplaceholder.typicode.com',
      'posts',
    );

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    List lista = jsonDecode(response.body);

    setState(() {
      resultado = jsonEncode(
        lista.take(5).toList(),
      );
    });
  }

  // POST
  Future<void> criarPost() async {
    var url = Uri.https(
      'jsonplaceholder.typicode.com',
      'posts',
    );

    Post post = Post(
      1,
      101,
      'Novo Post',
      'Conteúdo do post',
    );

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: post.toJson(),
    );

    setState(() {
      resultado = response.body;
    });
  }

  // PUT
  Future<void> atualizarPost() async {
    var url = Uri.https(
      'jsonplaceholder.typicode.com',
      'posts/1',
    );

    Post post = Post(
      1,
      1,
      'Post Atualizado',
      'Novo conteúdo',
    );

    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: post.toJson(),
    );

    setState(() {
      resultado = response.body;
    });
  }

  // DELETE
  Future<void> deletarPost() async {
    var url = Uri.https(
      'jsonplaceholder.typicode.com',
      'posts/1',
    );

    final response = await http.delete(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    setState(() {
      resultado =
          'DELETE realizado com status: ${response.statusCode}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSONPlaceholder'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch,
          children: [

            // BOTÕES
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: getPost,
                  child: Text('GET'),
                ),

                ElevatedButton(
                  onPressed: getLista,
                  child: Text('GET LISTA'),
                ),

                ElevatedButton(
                  onPressed: criarPost,
                  child: Text('POST'),
                ),

                ElevatedButton(
                  onPressed: atualizarPost,
                  child: Text('PUT'),
                ),

                ElevatedButton(
                  onPressed: deletarPost,
                  child: Text('DELETE'),
                ),
              ],
            ),

            SizedBox(height: 20),

            // RESULTADO
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    resultado,
                    style: TextStyle(fontSize: 16),
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
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'contador.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Contador(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
//construtor, que carrega a lista de tarefas do Hive
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador com Provider'),
        centerTitle: true,
      ),

      body: Center(
        child: Consumer<Contador>(
          builder: (context, contador, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Valor do contador:',
                  style: TextStyle(fontSize: 22),
                ),

                const SizedBox(height: 15),

                Text(
                  '${contador.valor}',
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        contador.decrementar();
                      },
                      child: const Text('Decrementar'),
                    ),

                    const SizedBox(width: 20),

                    ElevatedButton(
                      onPressed: () {
                        contador.incrementar();
                      },
                      child: const Text('Incrementar'),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
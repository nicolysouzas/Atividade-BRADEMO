import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TaskListScreen(),
    );
  }
}

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  // Dados simulando as tarefas
  final List<String> tasks = [
    "Task 2022-07-09\n18:08:31.734244",
    "Task 2022-07-09\n18:08:32.210300",
    "Task 2022-07-09\n18:08:32.629026",
    "Task 2022-07-09\n18:08:33.073472",
    "Task 2022-07-09\n18:08:33.524172",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kindacode.com"),
        centerTitle: true,
        backgroundColor: CupertinoColors.activeBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("View Completed Tasks"),
            ),
            const SizedBox(height: 16),
            const Text(
              "You have 5 uncompleted tasks",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.yellow[600], 
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        tasks[index],
                        style: const TextStyle(fontSize: 14),
                      ),
                      trailing: Checkbox(
                        value: false, // Estado inicial
                        onChanged: (bool? value) {},
                        fillColor: WidgetStateProperty.all(Colors.white),
                        checkColor: Colors.black,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // Botão Flutuante (FAB)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Exibe o AlertDialog
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: const Text("Você está no App de Notas de Tarefas"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("OK"),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tarefa_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController controller =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // TextField dentro do Consumer
            Consumer<TarefaProvider>(
              builder: (context, provider, child) {
                return Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          hintText: 'Digite uma tarefa',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    ElevatedButton(
                      onPressed: () {
                        provider.adicionarTarefa(
                          controller.text,
                        );

                        controller.clear();
                      },
                      child: const Text('Adicionar'),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(height: 20),

            // ListView dentro do Consumer
            Expanded(
              child: Consumer<TarefaProvider>(
                builder: (context, provider, child) {
                  if (provider.tarefas.isEmpty) {
                    return const Center(
                      child: Text(
                        'Nenhuma tarefa adicionada',
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: provider.tarefas.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(
                            provider.tarefas[index],
                          ),

                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              provider.removerTarefa(index);
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
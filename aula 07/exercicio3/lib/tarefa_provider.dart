import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

class TarefaProvider extends ChangeNotifier {
  List<String> tarefas = [];
  late Box box;

  // Construtor
  TarefaProvider() {
    carregarTarefas();
  }

  void carregarTarefas() {
    box = Hive.box('tarefasBox');

    tarefas = List<String>.from(
      box.get('listaTarefas', defaultValue: []),
    );

    notifyListeners();
  }

  // Adicionar tarefa
  void adicionarTarefa(String tarefa) {
    if (tarefa.trim().isEmpty) return;

    tarefas.add(tarefa);

    // Salvar no Hive
    box.put('listaTarefas', tarefas);

    notifyListeners();
  }

  // Remover tarefa
  void removerTarefa(int index) {
    tarefas.removeAt(index);

    // Atualiza Hive
    box.put('listaTarefas', tarefas);

    notifyListeners();
  }
}
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa o Hive
  await Hive.initFlutter();

  // Abre a box antes do app iniciar
  await Hive.openBox('configuracoes');

  runApp(const MyApp());
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Box box;

  // false = Relax
  // true = Focado
  bool modoFocado = false;

  @override
  void initState() {
    super.initState();

    box = Hive.box('configuracoes');

    // Recupera estado salvo
    modoFocado = box.get('modoFocado', defaultValue: false);
  }

  void alternarModo() {
    setState(() {
      modoFocado = !modoFocado;
    });

    // Salva no Hive
    box.put('modoFocado', modoFocado);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          modoFocado ? Colors.black : Colors.blue,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              modoFocado
                  ? 'Modo Focado'
                  : 'Modo Relax',
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: alternarModo,
              child: const Text('Trocar Modo'),
            ),
          ],
        ),
      ),
    );
  }
}
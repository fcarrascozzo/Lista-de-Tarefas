import 'package:flutter/material.dart';
import 'package:flutter_lista_tarefas/screens/tela_inicial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const TelaInicial()
    );
  }
}

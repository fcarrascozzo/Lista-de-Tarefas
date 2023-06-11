import 'package:flutter/material.dart';

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
      home: Scaffold(
          backgroundColor: const Color(0xfff4f1e9),
          appBar: AppBar(
            backgroundColor: const Color(0xff2b463c),
            title: const Text('Lista de Tarefas'),
          ),
          body: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Tarefas('Tarefa 1'),
              Tarefas('Tarefa 2'),
              Tarefas('Tarefa 3')
            ],
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: const Color(0xff2b463c), onPressed: () {})),
    );
  }
}

class Tarefas extends StatelessWidget {
  final String nomeTarefa;
  const Tarefas(this.nomeTarefa, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color(0xff688f4e),
          height: 140,
        ),
        Container(
          height: 100,
          color: const Color(0xfff4f1e9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.black26,
                width: 72,
                height: 100,
              ),
              Text(nomeTarefa),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff688f4e)
                ),
                  onPressed: (){},
                  child: const Icon(Icons.add)
              )
            ],
          ),
        ),
      ],
    );
  }
}

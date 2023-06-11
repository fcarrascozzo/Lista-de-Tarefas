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
        backgroundColor: const Color(0xffE0E1DC),
        appBar: AppBar(
          backgroundColor: const Color(0xff1D2538),
          title: const Text(
            'Lista de Tarefas',
            style: TextStyle(
                color: Color(0xffE0E1DC), fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          children: const [
            Tarefas('Tarefa 1'),
            Tarefas('Tarefa 2'),
            Tarefas('Tarefa 3'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff1D2538),
          onPressed: () {},
        ),
      ),
    );
  }
}

class Tarefas extends StatefulWidget {
  final String nomeTarefa;

  const Tarefas(this.nomeTarefa, {super.key});

  @override
  State<Tarefas> createState() => _TarefasState();
}

class _TarefasState extends State<Tarefas> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            color: const Color(0xff475B74),
            height: 140,
          ),
          Column(
            children: [
              Container(
                height: 100,
                color: const Color(0xff7C8DA5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.black26,
                      width: 72,
                      height: 100,
                    ),
                    SizedBox(
                      width: 200,
                      child: Text(
                        widget.nomeTarefa,
                        style: const TextStyle(
                            fontSize: 24,
                            overflow: TextOverflow.ellipsis,
                            color: Color(0xffE0E1DC),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff1D2538),
                        ),
                        onPressed: () {
                          setState(() {
                            nivel++;
                          });
                        },
                        child: const Icon(Icons.add))
                  ],
                ),
              ),
              Text(
                'Nível: $nivel',
                style: TextStyle(color: Color(0xffE0E1DC), fontSize: 16),
              )
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NovaTarefa extends StatefulWidget {
  const NovaTarefa({super.key});

  @override
  State<NovaTarefa> createState() => _NovaTarefaState();
}

class _NovaTarefaState extends State<NovaTarefa> {
  @override
  Widget build(BuildContext context) {
    var _windowSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_return)),
        backgroundColor: const Color(0xff1D2538),
        title: const Text(
          'Lista de Tarefas',
          style:
              TextStyle(color: Color(0xffE0E1DC), fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Color(0xffE0E1DC),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xff7C8DA5),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 3,
                color: Color(0xff1D2538),
              )),
          height: _windowSize.height * 0.85,
          width: _windowSize.width * 0.9,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Insira o nome da Tarefa',
                    fillColor: Color(0xffE0E1DC),
                    filled: true
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

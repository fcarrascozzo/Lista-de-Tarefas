import 'package:flutter/material.dart';
import 'package:flutter_lista_tarefas/components/tarefas.dart';
import 'package:flutter_lista_tarefas/screens/tela_nova_tarefa.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  bool isOpacity = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE0E1DC),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              setState(() {
                isOpacity = !isOpacity;
              });
            },
            icon: isOpacity
                ? const Icon(Icons.remove_red_eye_outlined)
                : const Icon(Icons.remove_red_eye)),
        backgroundColor: const Color(0xff1D2538),
        title: const Text(
          'Lista de Tarefas',
          style: TextStyle(
              color: Color(0xffE0E1DC), fontWeight: FontWeight.bold),
        ),
      ),
      body: AnimatedOpacity(
        opacity: isOpacity ? 1 : 0,
        duration: const Duration(milliseconds: 1000),
        child: ListView(
          children: const [
            Tarefas(
              'Estudar Flutter',
              'assets/images/imagem1.jpg',
              3,
            ),
            Tarefas(
              'Aprofundar conhecimento Flutter',
              'assets/images/imagem.jpg',
              5,
            ),
            Tarefas(
              'Criar um app',
              'assets/images/imagem2.jpg',
              5,
            ),
            Tarefas(
              'Estudar Git',
              'assets/images/imagem6.png',
              3,
            ),
            Tarefas(
              'Estudar JS',
              'assets/images/imagem4.jpg',
              4,
            ),
            Tarefas(
              'Estudar Dart',
              'assets/images/imagem5.jpg',
              5,
            ),
            SizedBox(
              height: 70,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff1D2538),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NovaTarefa()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
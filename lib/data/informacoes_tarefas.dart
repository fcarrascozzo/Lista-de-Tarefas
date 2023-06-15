import 'package:flutter/material.dart';
import 'package:flutter_lista_tarefas/components/tarefas.dart';

class InformacaoTarefa extends InheritedWidget {
  InformacaoTarefa({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Tarefas> listaTarefas = [
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
  ];

  void novaTarefa(String nome, String foto, int dificuldade){
    listaTarefas.add(Tarefas(nome, foto, dificuldade));
  }

  static InformacaoTarefa of(BuildContext context) {
    final InformacaoTarefa? result =
        context.dependOnInheritedWidgetOfExactType<InformacaoTarefa>();
    assert(result != null, 'No InformacaoTarefa found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(InformacaoTarefa old) {
    return old.listaTarefas.length != listaTarefas.length;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_lista_tarefas/components/tarefas.dart';
import 'package:sqflite/sqflite.dart';

import 'database.dart';

class TarefaDao {
  static const String nomeTabela = 'Tarefas';
  static const String tar_nome = 'nome';
  static const String tar_dificuldade = 'dificuldade';
  static const String tar_imagem = 'imagem';

  static const String criarTabela = 'CREATE TABLE $nomeTabela('
      '$tar_nome TEXT, '
      '$tar_dificuldade INTEGER, '
      '$tar_imagem TEXT)';

  salvarTarefa(Tarefas tarefa) async {}

  Future<List<Tarefas>> obterTarefasBanco() async {
    debugPrint('Acessando o obterTarefasBanco');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> retorno = await bancoDeDados.query(nomeTabela);
    debugPrint('Procurando dados no banco de dados, encontrado: $retorno');
    return toList(retorno);
  }

  List<Tarefas> toList(List<Map<String, dynamic>> listaDeTarefas) {
    debugPrint('Convertendo para Lista: ');
    final List<Tarefas> tarefas = [];
    for (Map<String, dynamic> cadaTarefa in listaDeTarefas) {
      final Tarefas tarefa = Tarefas(cadaTarefa[tar_nome], cadaTarefa[tar_imagem], cadaTarefa[tar_dificuldade]);
      tarefas.add(tarefa);
    }
    debugPrint('Lista de Tarefas populada $tarefas');
    return tarefas;
  }

  Future<List<Tarefas>> buscarTarefa(String nomeTarefa) async {
    debugPrint('acessando buscarTarefas');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> retorno = await bancoDeDados.query(
      nomeTabela,
      where: '$tar_nome = ?',
      whereArgs: [nomeTarefa],
    );
    debugPrint('Tarefa encontrada: ${toList(retorno)}');
    return toList(retorno);
  }

  deletarTarefa(String nomeTarefa) async {}
}

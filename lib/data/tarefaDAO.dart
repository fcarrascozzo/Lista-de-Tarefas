import 'package:flutter_lista_tarefas/components/tarefas.dart';

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

  Future<List<Tarefas>> obterTarefasBanco() async {}

  Future<List<Tarefas>> buscarTarefa(String nomeTarefa) async {}

  deletarTarefa(String nomeTarefa) async {

  }
}

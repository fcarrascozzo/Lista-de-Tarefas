import 'package:flutter_lista_tarefas/data/tarefaDAO.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
    final String path = join(await getDatabasesPath(), 'tarefa.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute(TarefaDao.criarTabela);
    }, version: 1,);
  }

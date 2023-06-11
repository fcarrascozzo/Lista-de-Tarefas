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
          backgroundColor: Color(0xfff4f1e9),
          appBar: AppBar(
            backgroundColor: Color(0xff2b463c),
            title: Text('Lista de Tarefas'),
          ),
          body: Container(
            child: Stack(
              children: [
                Container(
                  color: Color(0xff688f4e),
                  height: 140,
                ),
                Container(
                  height: 100,
                  color: Color(0xfff4f1e9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.black26,
                        width: 72,
                        height: 100,
                      ),
                      Text('Primeira Tarefa'),
                      ElevatedButton(
                          onPressed: (){},
                          child: Icon(Icons.add)
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Color(0xff2b463c), onPressed: () {})),
    );
  }
}

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
          leading: Container(),
          backgroundColor: const Color(0xff1D2538),
          title: const Text(
            'Lista de Tarefas',
            style: TextStyle(
                color: Color(0xffE0E1DC), fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
          children: const [
            Tarefas(
              'Estudar Flutter',
              'https://res.cloudinary.com/dnegavcrl/images/f_auto,q_auto/v1678438365/Flutter-Dash-Sticer/Flutter-Dash-Sticer.png?_i=AA',
              3,
            ),
            Tarefas(
              'Aprofundar conhecimento Flutter',
              'https://ih1.redbubble.net/image.1076687066.0716/st,small,507x507-pad,600x600,f8f8f8.u2.jpg',
              5,
            ),
            Tarefas(
              'Criar um app',
              'https://blog.logrocket.com/wp-content/uploads/2022/05/adaptive-icons-flutter-launcher-icons.png',
              5,
            ),
            Tarefas(
              'Estudar Git',
              'https://www.oomnitza.com/wp-content/uploads/2022/06/github-logo-300x300.png',
              3,
            ),
            Tarefas(
              'Estudar JS',
              'https://upload.wikimedia.org/wikipedia/commons/6/6a/JavaScript-logo.png',
              4,
            ),
            Tarefas(
              'Estudar Dart',
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwm7JasTw3bd-cgrMyh3LoCdbHtnc0OT50N_TbKqhJHP2Ql7PXMjV083SxSYZd_yDEoZs&usqp=CAU',
              5,
            ),
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
  final String fotoTarefa;
  final int dificuldadeTarefa;

  const Tarefas(this.nomeTarefa, this.fotoTarefa, this.dificuldadeTarefa,
      {super.key});

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
                      child: Image.network(
                        widget.fotoTarefa,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.nomeTarefa,
                            style: const TextStyle(
                                fontSize: 17,
                                overflow: TextOverflow.ellipsis,
                                color: Color(0xffE0E1DC),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.dificuldadeTarefa >= 1) ? Color(0xff1D2538) : Color(0xff475B74),
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.dificuldadeTarefa >= 2) ? Color(0xff1D2538) : Color(0xff475B74),
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.dificuldadeTarefa >= 3) ? Color(0xff1D2538) : Color(0xff475B74),
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.dificuldadeTarefa >= 4) ? Color(0xff1D2538) : Color(0xff475B74),
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: (widget.dificuldadeTarefa >= 5) ? Color(0xff1D2538) : Color(0xff475B74),
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      width: 52,
                      height: 52,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff1D2538),
                          ),
                          onPressed: () {
                            setState(() {
                              nivel++;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.add),
                              Text(
                                'UP',
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Color(0xffE0E1DC),
                        value: (widget.dificuldadeTarefa > 0) ? (nivel / widget.dificuldadeTarefa) / 10 : 1,
                        backgroundColor: const Color(0xff1D2538),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Nível: $nivel',
                      style: TextStyle(color: Color(0xffE0E1DC), fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

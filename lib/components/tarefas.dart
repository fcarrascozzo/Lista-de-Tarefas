import 'package:flutter/material.dart';

import 'dificuldade.dart';

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
            decoration: BoxDecoration(
                color: const Color(0xff475B74),
                borderRadius: BorderRadius.circular(5)),
            height: 140,
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 12),
                height: 100,
                decoration: BoxDecoration(
                    color: const Color(0xff7C8DA5),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(5)),
                      width: 72,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          widget.fotoTarefa,
                          fit: BoxFit.cover,
                        ),
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
                        Dificuldade(
                          dificuldadeInformada: widget.dificuldadeTarefa,
                        )
                      ],
                    ),
                    SizedBox(
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
                          child: const Column(
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
                        color: const Color(0xffE0E1DC),
                        value: (widget.dificuldadeTarefa > 0)
                            ? (nivel / widget.dificuldadeTarefa) / 10
                            : 1,
                        backgroundColor: const Color(0xff1D2538),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Nível: $nivel',
                      style: const TextStyle(
                          color: Color(0xffE0E1DC), fontSize: 16),
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
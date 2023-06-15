import 'package:flutter/material.dart';

class NovaTarefa extends StatefulWidget {
  const NovaTarefa({super.key});

  @override
  State<NovaTarefa> createState() => _NovaTarefaState();
}

class _NovaTarefaState extends State<NovaTarefa> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController dificuldadeController = TextEditingController();
  TextEditingController fotoController = TextEditingController();

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  controller: nomeController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Insira o nome da Tarefa',
                    fillColor: Color(0xffE0E1DC),
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  controller: dificuldadeController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Insira a díficuldade',
                    fillColor: Color(0xffE0E1DC),
                    filled: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextFormField(
                  controller: fotoController,
                  onChanged: (text){
                    setState(() {

                    });
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Insira a imagem',
                    fillColor: Color(0xffE0E1DC),
                    filled: true,
                  ),
                ),
              ),
              Container(
                width: 72,
                height: 100,
                decoration: BoxDecoration(
                    color: Color(0xff475B74),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: Color(0xff1D2538),
                    )
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                      fotoController.text,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                        return Image.asset('assets/images/vazio.png');
                    },
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    print(nomeController);
                    print(int.parse(dificuldadeController.text));
                    print(fotoController);
                  },
                  child: Text('Adicionar'))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_lista_tarefas/data/informacoes_tarefas.dart';

class NovaTarefa extends StatefulWidget {
  const NovaTarefa({super.key, required this.tarefaContext});

  final BuildContext tarefaContext;

  @override
  State<NovaTarefa> createState() => _NovaTarefaState();
}

class _NovaTarefaState extends State<NovaTarefa> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController dificuldadeController = TextEditingController();
  TextEditingController fotoController = TextEditingController();

  bool validador(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool validadorDificuldade(String? value){
    if(value!.isEmpty || int.parse(value) > 5 ||
        int.parse(value) < 1){
      return true;
    }
    return false;
  }


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var windowSize = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.keyboard_return)),
          backgroundColor: const Color(0xff1D2538),
          title: const Text(
            'Lista de Tarefas',
            style: TextStyle(
                color: Color(0xffE0E1DC), fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: const Color(0xffE0E1DC),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xff7C8DA5),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 3,
                    color: const Color(0xff1D2538),
                  )),
              height: windowSize.height * 0.85,
              width: windowSize.width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      validator: (String? value) {
                        if (validador(value)) {
                          return 'Insira o nome da Tarefa!';
                        }
                        return null;
                      },
                      controller: nomeController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
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
                      keyboardType: TextInputType.number,
                      controller: dificuldadeController,
                      validator: (value) {
                        if (validadorDificuldade(value)) {
                          return 'Insira um número de 1 a 5!';
                        }
                        return null;
                      },
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
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
                      validator: (value) {
                        if (validador(value)) {
                          return 'Insira um URL de Imagem!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      controller: fotoController,
                      onChanged: (text) {
                        setState(() {});
                      },
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
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
                        color: const Color(0xff475B74),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: const Color(0xff1D2538),
                        )),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        fotoController.text,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.asset('assets/images/vazio.png');
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          InformacaoTarefa.of(widget.tarefaContext).novaTarefa(
                              nomeController.text,
                              fotoController.text,
                              int.parse(dificuldadeController.text));

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Salvando e criando nova tarefa',
                              ),
                            ),
                          );

                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Adicionar'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

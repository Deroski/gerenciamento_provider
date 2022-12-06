import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//State Management
//Provider é um provedor de dados
void main() {
  //gerenciando estado no stateless com Provider
  runApp(
    ChangeNotifierProvider(
      create: (_) => Pessoa(
          nome: 'Chris', idade: 30), //esse que vale agora pra passar o valor
      child: MyApp(),
    ),
  ); //Usando CONSUMER no PROVIDER em FLUTTER
} //mudança de estado com stl mesmo, nao depende mais do stf

class Pessoa with ChangeNotifier {
  String nome = 'Christian';
  int idade = 30;

  Pessoa({required this.nome, required this.idade});

  void incrementaIdade() {
    print('Método incrementa idade chamado');
    this.idade++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<Pessoa>(
        builder: (context, pessoa, child) => Scaffold(
          appBar: AppBar(
            elevation: 20,
            backgroundColor: Color.fromARGB(255, 255, 128, 0),
            title: Center(
              child: Text(
                'Provider GE',
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
            ),
          ),
          body: Center(
              child: Text(
            pessoa.nome + ' tem ${pessoa.idade} anos de idade',
            style: TextStyle(fontSize: 20),
          )),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 255, 128, 0),
            onPressed: () => pessoa.incrementaIdade(),
            //print('pressionado'),
          ),
        ),
      ),
    );
  }
}
// STF nao se comunica com outros widgets 
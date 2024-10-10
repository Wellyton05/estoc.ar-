import 'package:flutter/material.dart';

class Movimentacao extends StatefulWidget {
  const Movimentacao({super.key});

  @override
  _MovimentacaoState createState() => _MovimentacaoState();
}

class _MovimentacaoState extends State<Movimentacao> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movimentação'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Define a cor do botão de voltar como branco
        ),
        backgroundColor: Color.fromARGB(255, 4, 57, 89),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            onPressed: () {
              print('Ícone de usuário clicado');
            },
          ),
        ],
      ),      
    );
  }
}

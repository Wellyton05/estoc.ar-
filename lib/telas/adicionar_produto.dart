import 'package:flutter/material.dart';

class AdicionarProduto extends StatelessWidget {
  const AdicionarProduto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Produto'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Define a cor do botão de voltar como branco
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person,
              color: Colors.white, // Cor do ícone corrigida
            ),
            onPressed: () {
              print('Ícone de usuário clicado');
            },
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 4, 57, 89),
      ),
      body: const Center(
        child: Text("Tela de adicionar produto"),
      ),
    );
  }
}

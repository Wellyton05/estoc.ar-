import 'package:flutter/material.dart';

class EditarProduto extends StatelessWidget {
  final String produto;

  // Adicione o parâmetro 'produto' ao construtor
  const EditarProduto({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(produto), // Usando o nome do produto no título
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // Define a cor do botão de voltar como branco
        ),
        backgroundColor: Color(0xFF015299),
        centerTitle: true,
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
      body: Center(
        child: Text(
          'Aqui você pode editar o $produto', // Exibe o nome do produto
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

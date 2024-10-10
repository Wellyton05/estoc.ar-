import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person,
              color: Color.fromARGB(255, 1, 82, 153),
            ),
            onPressed: () {
              print('Ícone de usuário clicado');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // 2 colunas
          crossAxisSpacing: 10, // Espaçamento horizontal
          mainAxisSpacing: 10, // Espaçamento vertical
          children: [
            _buildSquareButton('CADASTRO PRODUTO', () {
              Navigator.pushNamed(context, '/listar_produtos'); // Navega para ListarProdutos
            }),
            _buildSquareButton('CADASTRO ESTOQUE', () {
              print('Botão 2 clicado');
            }),
            _buildSquareButton('REALIZAR MOVIMENTAÇÃO', () {
              print('Botão 3 clicado');
            }),
            _buildSquareButton('CONSULTAR MOVIMENTAÇÃO', () {
              print('Botão 4 clicado');
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSquareButton(String text, VoidCallback onPressed) {
    return Container(
      width: 80, // Largura do botão
      height: 80, // Altura do botão para torná-lo quadrado
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 1, 82, 153), // Fundo azul
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // Remove a curvatura do botão
          ),
          padding: EdgeInsets.zero, // Remove o padding padrão do botão
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white, // Cor do texto
          ),
        ),
      ),
    );
  }
}

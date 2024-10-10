import 'package:flutter/material.dart';
import 'package:telas_app/telas/listar_estoques.dart';
import 'package:telas_app/telas/listar_produtos.dart';
import 'package:telas_app/telas/movimentacao.dart';
import 'package:telas_app/util/util.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person,
              color: Color.fromARGB(255, 4, 57, 89),
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
          crossAxisSpacing: 12, // Espaçamento horizontal
          mainAxisSpacing: 12, // Espaçamento vertical
          children: [
            _buildSquareButton('CADASTRO PRODUTO', () {
              Util.NavegarDireitaPara(context, const ListarProdutos());
            }),
            _buildSquareButton('CADASTRO ESTOQUE', () {
              //Navigator.pushNamed(context, '/estoque'); 
              Util.NavegarDireitaPara(context, const ListarEstoques());
            }),
            _buildSquareButton('REALIZAR MOVIMENTAÇÃO', () {
              Util.NavegarDireitaPara(context, const Movimentacao());
            }),
            _buildSquareButton('CONSULTAR MOVIMENTAÇÃO', () {
              print('Botão 4 clicado');
            }),
          ],
        ),
      ),
    );
  }

Route _createRoute(Widget Page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Page, // Substitua `NextPage` pela tela de destino
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0); // Início da animação (vindo da direita)
      const end = Offset.zero; // Fim da animação (posição final)
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

  Widget _buildSquareButton(String text, VoidCallback onPressed) {
    return Container(
      width: 80, // Largura do botão
      height: 80, // Altura do botão para torná-lo quadrado
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 4, 57, 89), // Fundo azul
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0), // Remove a curvatura do botão
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

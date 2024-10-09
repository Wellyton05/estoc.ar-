/*import 'package:flutter/material.dart';
import 'package:telas_app/telas/home.dart';
//import 'package:telas_app/telas/listar_produtos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:telas_app/telas/home.dart';
import 'package:telas_app/telas/listar_produtos.dart'; // Importe a nova tela

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(), // Tela inicial
      routes: {
        '/listar_produtos': (context) => const ListarProdutos(), // Rota para ListarProdutos
      },
    );
  }
}


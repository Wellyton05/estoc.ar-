import 'package:flutter/material.dart';
import 'package:telas_app/telas/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //home: const Home(), // Tela inicial
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {},
    );
  }
}

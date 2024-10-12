import 'package:flutter/material.dart';

class RealizarMovimentacao extends StatefulWidget {
  const RealizarMovimentacao({super.key});

  final int produtoId = 1;
  final int estoqueId = 5;

  @override
  _RealizarMovimentacao createState() => _RealizarMovimentacao();
}

class _RealizarMovimentacao extends State<RealizarMovimentacao> {
  final _quantidadeController = TextEditingController();
  final _custoController = TextEditingController();
  String tipoMovimentacao = 'Entrada';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movimentação'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 4, 57, 89),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white),
            onPressed: () {
              print('Ícone de usuário clicado');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Produto',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Pesquisar produto',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        print('Pesquisar');
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            const Text('Estoque',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Pesquisar produto',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        print('Pesquisar');
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Quantidade',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextFormField(
              controller: _quantidadeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digite a quantidade',
              ),
            ),
            const SizedBox(height: 20),
            const Text('Custo', style: TextStyle(fontWeight: FontWeight.bold)),
            TextFormField(
              controller: _custoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digite o custo',
              ),
            ),
            const SizedBox(height: 20),
            const Text('Tipo', style: TextStyle(fontWeight: FontWeight.bold)),
            Column(
              children: [
                RadioListTile<String>(
                  title: const Text('Entrada'),
                  value: 'Entrada',
                  groupValue: tipoMovimentacao,
                  onChanged: (value) {
                    setState(() {
                      tipoMovimentacao = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Saída'),
                  value: 'Saída',
                  groupValue: tipoMovimentacao,
                  onChanged: (value) {
                    setState(() {
                      tipoMovimentacao = value!;
                    });
                  },
                ),
              ],
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  print('Movimentação realizada!');
                  Navigator.pop(context);
                },
                child: const Text('Realizar Movimentação'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 4, 57, 89),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

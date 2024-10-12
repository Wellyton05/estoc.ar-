import 'package:flutter/material.dart';

class MovimentacaoDetalhe extends StatelessWidget {
  final int produtoId;
  final int estoqueId;

  MovimentacaoDetalhe({
    required this.produtoId,
    required this.estoqueId,
  });

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
          color: Colors.white, // Cor do ícone de voltar
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Produto',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text('#$produtoId Produto Teste $produtoId'),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Estoque',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text('#$estoqueId Estoque Teste $estoqueId'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('Produto')),
                    DataColumn(label: Text('Estoque')),
                    DataColumn(label: Text('Custo')),
                    DataColumn(label: Text('Tipo')),
                    DataColumn(label: Text('Qtd')),
                  ],
                  rows: const <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('#1')),
                        DataCell(Text('#5')),
                        DataCell(Text('3,65')),
                        DataCell(Text('Entrada')),
                        DataCell(Text('72')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('#1')),
                        DataCell(Text('#5')),
                        DataCell(Text('3,65')),
                        DataCell(Text('Saída')),
                        DataCell(Text('52')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('#1')),
                        DataCell(Text('#5')),
                        DataCell(Text('3,94')),
                        DataCell(Text('Entrada')),
                        DataCell(Text('30')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('#1')),
                        DataCell(Text('#5')),
                        DataCell(Text('3,94')),
                        DataCell(Text('Saída')),
                        DataCell(Text('25')),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text('Qtd Saldo: 25',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

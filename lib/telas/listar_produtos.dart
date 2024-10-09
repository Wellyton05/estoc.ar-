import 'package:flutter/material.dart';

class ListarProdutos extends StatefulWidget {
  const ListarProdutos({super.key});

  @override
  _ListarProdutosState createState() => _ListarProdutosState();
}

class _ListarProdutosState extends State<ListarProdutos> {
  final TextEditingController _searchController = TextEditingController();
  List<String> produtos = [
    'Produto 1',
    'Produto 2',
    'Produto 3',
    'Produto 4',
    'Produto 5'
  ]; // Lista de produtos
  List<String> produtosFiltrados = []; // Lista para os produtos filtrados

  @override
  void initState() {
    super.initState();
    produtosFiltrados = produtos; // Inicia com todos os produtos
    _searchController.addListener(_filterProdutos); // Filtra conforme digita
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterProdutos() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      produtosFiltrados = produtos.where((produto) {
        return produto.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LISTAR PRODUTOS'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.person,
              color: Color.fromARGB(255, 1, 82, 153),
            ),
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
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Pesquisar produto...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: produtosFiltrados.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(produtosFiltrados[index]),
                  onTap: () {
                    print('Produto ${produtosFiltrados[index]} selecionado');
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Pesquisar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Adicionar',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            print('Botão de pesquisar clicado');
          } else if (index == 1) {
            print('Botão de adicionar clicado');
          }
        },
      ),
    );
  }
}

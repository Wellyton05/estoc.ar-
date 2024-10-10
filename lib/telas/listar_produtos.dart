import 'package:flutter/material.dart';
import 'package:telas_app/telas/home.dart';
import 'package:telas_app/util/util.dart';
import 'editar_produto.dart'; // Importa o arquivo de edição do produto
import 'adicionar_produto.dart'; // Importa o arquivo de adicionar produto

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
        title: const Text('Produtos'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, // Define a cor do botão de voltar como branco
        ),
        backgroundColor: const Color.fromARGB(255, 4, 57, 89),
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Pesquisar produto...',
                prefixIcon: const Icon(Icons.search),
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
                    // Navegar para a tela de editar produto
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditarProduto(
                          produto: produtosFiltrados[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor:
            Colors.white, // Cor dos ícones selecionados em branco
        unselectedItemColor: Colors.white70, // Cor dos ícones não selecionados
        backgroundColor: const Color.fromARGB(255, 4, 57, 89),
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
            // Navegar para a tela de adicionar produto
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AdicionarProduto(), // Tela de adicionar produto
              ),
            );
          }
        },
      ),
    );
  }
}

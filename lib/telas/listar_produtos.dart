import 'package:flutter/material.dart';
import 'editar_produto.dart';
import 'adicionar_produto.dart';

class ListarProdutos extends StatefulWidget {
  const ListarProdutos({super.key});

  @override
  _ListarProdutosState createState() => _ListarProdutosState();
}

class _ListarProdutosState extends State<ListarProdutos> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> produtos = [
    {'nome': 'Produto 1', 'imagem': 'images/perfume.png', 'custo': 19.99},
    {'nome': 'Produto 2', 'imagem': 'images/perfume.png', 'custo': 29.99},
    {'nome': 'Produto 3', 'imagem': 'images/perfume.png', 'custo': 9.99},
    {'nome': 'Produto 4', 'imagem': 'images/perfume.png', 'custo': 39.99},
    {'nome': 'Produto 5', 'imagem': 'images/perfume.png', 'custo': 49.99},
  ];

  List<Map<String, dynamic>> produtosFiltrados = [];

  @override
  void initState() {
    super.initState();
    produtosFiltrados = produtos;
    _searchController.addListener(_filterProdutos);
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
        return produto['nome'].toLowerCase().contains(query);
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
          color: Colors.white,
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
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Pesquisar produto',
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
          Expanded(
            child: ListView.builder(
              itemCount: produtosFiltrados.length,
              itemBuilder: (context, index) {
                final produto = produtosFiltrados[index];
                return ListTile(
                  title: Text(produto['nome']),
                  subtitle: Text(
                    'R\$ ${produto['custo'].toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 14),
                  ),
                  leading: Image.asset(
                    produto['imagem'],
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditarProduto(
                          produto: produto['nome'],
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
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ListarProdutos(),
              ),
            );
          } else if (index == 1) {
            //
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AdicionarProduto(),
              ),
            );
          }
        },
      ),
    );
  }
}

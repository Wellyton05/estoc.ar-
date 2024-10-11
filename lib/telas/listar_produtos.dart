import 'package:flutter/material.dart';
import 'editar_produto.dart'; // Importa o arquivo de edição do produto
import 'adicionar_produto.dart'; // Importa o arquivo de adicionar produto

class ListarProdutos extends StatefulWidget {
  const ListarProdutos({super.key});

  @override
  _ListarProdutosState createState() => _ListarProdutosState();
}

class _ListarProdutosState extends State<ListarProdutos> {
  final TextEditingController _searchController = TextEditingController();
  
  // Atualizando a lista para incluir imagem e custo de cada produto
  final List<Map<String, dynamic>> produtos = [
    {
      'nome': 'Produto 1',
      'imagem': 'assets/images/perfume.png', 
      'custo': 19.99
    },
    {
      'nome': 'Produto 2',
      'imagem': 'assets/images/perfume.png',
      'custo': 29.99
    },
    {
      'nome': 'Produto 3',
      'imagem': 'assets/images/perfume.png',
      'custo': 9.99
    },
    {
      'nome': 'Produto 4',
      'imagem': 'assets/images/perfume.png',
      'custo': 39.99
    },
    {
      'nome': 'Produto 5',
      'imagem': 'assets/perfume.png',
      'custo': 49.99
    },
  ]; // Lista de produtos com imagem e custo
  
  List<Map<String, dynamic>> produtosFiltrados = []; // Lista para os produtos filtrados

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
                final produto = produtosFiltrados[index];
                return ListTile(
                  title: Text(produto['nome']),
                  subtitle: Text(
                    'R\$ ${produto['custo'].toStringAsFixed(2)}', // Exibe o custo
                    style: const TextStyle(fontSize: 14), // Texto menor
                  ),
                  leading: Image.asset(
                    produto['imagem'], // Exibe a imagem do produto
                    width: 50, // Defina o tamanho da imagem
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    // Navegar para a tela de editar produto
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ListarProdutos(), // Tela de adicionar produto
              ),
            );
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

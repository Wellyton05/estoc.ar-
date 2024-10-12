import 'package:flutter/material.dart';
import 'adicionar_estoque.dart';
import 'editar_estoque.dart';

class ListarEstoques extends StatefulWidget {
  const ListarEstoques({super.key});

  @override
  _ListarEstoquesState createState() => _ListarEstoquesState();
}

class _ListarEstoquesState extends State<ListarEstoques> {
  final TextEditingController _searchController = TextEditingController();
  List<String> estoques = [
    'Estoque 1',
    'Estoque 2',
    'Estoque 3',
    'Estoque 4',
    'Estoque 5'
  ];
  List<String> estoquesFiltrados = [];

  @override
  void initState() {
    super.initState();
    estoquesFiltrados = estoques;
    _searchController.addListener(_filterestoques);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterestoques() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      estoquesFiltrados = estoques.where((estoque) {
        return estoque.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estoque'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Color.fromARGB(255, 4, 57, 89),
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
              itemCount: estoquesFiltrados.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(estoquesFiltrados[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditarEstoque(
                          estoque: estoquesFiltrados[index],
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
        backgroundColor: Color.fromARGB(255, 4, 57, 89),
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
                builder: (context) => const ListarEstoques(),
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AdicionarEstoque(),
              ),
            );
          }
        },
      ),
    );
  }
}

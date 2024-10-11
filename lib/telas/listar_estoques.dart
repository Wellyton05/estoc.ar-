import 'package:flutter/material.dart';
import 'adicionar_estoque.dart';
import 'editar_estoque.dart'; // Importa o arquivo de edição do estoque

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
  ]; // Lista de estoques
  List<String> estoquesFiltrados = []; // Lista para os estoques filtrados

  @override
  void initState() {
    super.initState();
    estoquesFiltrados = estoques; // Inicia com todos os estoques
    _searchController.addListener(_filterestoques); // Filtra conforme digita
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
        title: Text('Estoque'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // Define a cor do botão de voltar como branco
        ),
        backgroundColor: Color.fromARGB(255, 4, 57, 89),
        actions: [
          IconButton(
            icon: Icon(
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
                hintText: 'Pesquisar estoque...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
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
                    //Navegar para a tela de editar estoque
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
        selectedItemColor:
            Colors.white, // Cor dos ícones selecionados em branco
        unselectedItemColor: Colors.white70, // Cor dos ícones não selecionados
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
            print('Botão de pesquisar clicado');
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AdicionarEstoque(), // Tela de adicionar produto
              ),
            );
          }
        },
      ),
    );
  }
}

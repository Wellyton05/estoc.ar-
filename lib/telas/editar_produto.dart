import 'package:flutter/material.dart';
import 'listar_produtos.dart';
import 'adicionar_produto.dart';

class EditarProduto extends StatelessWidget {
  final String produto;

  const EditarProduto({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    final TextEditingController descricaoController = TextEditingController();
    final TextEditingController custoController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(produto),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Color.fromARGB(255, 4, 57, 89),
        centerTitle: true,
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: descricaoController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Editar Descrição',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  print('Editar imagem');
                },
                icon: const Icon(Icons.image),
                label: const Text('Editar Imagem'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 4, 57, 89),
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: custoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Editar Custo do Produto',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    print('Produto editado');
                    Navigator.pop(context);
                  },
                  child: const Text('Editar'),
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
                builder: (context) => const ListarProdutos(),
              ),
            );
          } else if (index == 1) {
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

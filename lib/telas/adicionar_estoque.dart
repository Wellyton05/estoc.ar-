import 'package:flutter/material.dart';
import 'package:telas_app/telas/listar_estoques.dart';

class AdicionarEstoque extends StatelessWidget {
  const AdicionarEstoque({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nomeController = TextEditingController();
    final TextEditingController descricaoController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Estoque'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: () {
              print('Ícone de usuário clicado');
            },
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 4, 57, 89),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome do Estoque',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: descricaoController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Descrição do Estoque',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: descricaoController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Localização',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    print('Produto registrado');
                    Navigator.pop(context);
                  },
                  child: const Text('Registrar Estoque'),
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

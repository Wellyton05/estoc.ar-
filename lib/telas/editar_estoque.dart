import 'package:flutter/material.dart';
import 'adicionar_estoque.dart';
import 'listar_estoques.dart';

class EditarEstoque extends StatelessWidget {
  final String estoque;

  const EditarEstoque({super.key, required this.estoque});

  @override
  Widget build(BuildContext context) {
    final TextEditingController descricaoController = TextEditingController();
    final TextEditingController localizacaoController = TextEditingController();
    bool isAtivado = true;

    return Scaffold(
      appBar: AppBar(
        title: Text(estoque),
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
                controller: descricaoController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Editar Descrição',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: localizacaoController,
                decoration: const InputDecoration(
                  labelText: 'Editar Localização',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Situação do Estoque (Ativado/Desativado)'),
                  Switch(
                    value: isAtivado,
                    onChanged: (value) {
                      isAtivado = value;
                      print(
                          isAtivado ? 'Estoque ativado' : 'Estoque desativado');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    print('Estoque editado');
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

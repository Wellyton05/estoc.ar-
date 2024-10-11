import 'package:flutter/material.dart';
import 'package:telas_app/telas/listar_estoques.dart';

class AdicionarEstoque extends StatelessWidget {
  const AdicionarEstoque({super.key});

  @override
  Widget build(BuildContext context) {
    // Controladores de texto para os campos (não implementam lógica)
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
          color: Colors.white, // Define a cor do botão de voltar como branco
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person,
              color: Colors.white, // Cor do ícone corrigida
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
              // Campo para nome do produto
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
                    // Simulação de navegação ou ação ao clicar no botão
                    print('Produto registrado');
                    Navigator.pop(context); // Retorna à tela anterior
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
        selectedItemColor: Colors.white, // Cor dos ícones selecionados em branco
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
                builder: (context) =>
                    const ListarEstoques(), 
              ),
            );
          } else if (index == 1) {
            // Navegar para a tela de adicionar produto
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

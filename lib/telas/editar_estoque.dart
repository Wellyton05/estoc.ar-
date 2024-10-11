import 'package:flutter/material.dart';
import 'adicionar_estoque.dart';
import 'listar_estoques.dart';

class EditarEstoque extends StatelessWidget {
   final String estoque;

  const EditarEstoque({super.key, required this.estoque});

  @override
  Widget build(BuildContext context) {
    // Controladores de texto para os campos
    final TextEditingController descricaoController = TextEditingController();
    final TextEditingController localizacaoController = TextEditingController();
    bool isAtivado = true; // Variável para controlar a situação do estoque

    return Scaffold(
      appBar: AppBar(
        title: Text(estoque),
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
              // Campo para descrição do estoque
              TextField(
                controller: descricaoController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'Editar Descrição',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Campo para localização do estoque
              TextField(
                controller: localizacaoController,
                decoration: const InputDecoration(
                  labelText: 'Editar Localização',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Campo para situação do estoque (Ativado/Desativado)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Situação do Estoque (Ativado/Desativado)'),
                  Switch(
                    value: isAtivado,
                    onChanged: (value) {
                      // Atualiza a situação do estoque
                      isAtivado = value;
                      print(isAtivado ? 'Estoque ativado' : 'Estoque desativado');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Botão para editar (somente layout, sem lógica)
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Simulação de navegação ou ação ao clicar no botão
                    print('Estoque editado');
                    Navigator.pop(context); // Retorna à tela anterior
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
                    const ListarEstoques(), // Tela de adicionar produto
              ),
            );
          } else if (index == 1) {
            // Navegar para a tela de adicionar estoque
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AdicionarEstoque(), // Tela de adicionar estoque
              ),
            );
          }
        },
      ),
    );
  }
}

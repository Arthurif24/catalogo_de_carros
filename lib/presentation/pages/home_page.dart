import 'package:flutter/material.dart';

import '../../domain/usecases/listar_carros.dart';
import '../widgets/carro_card.dart';
import 'detalhes_page.dart';

/// Tela 1: lista de carros.
class HomePage extends StatelessWidget {
  final String title;
  final ListarCarros listarCarros;

  const HomePage({
    super.key,
    required this.title,
    this.listarCarros = const ListarCarros(),
  });

  @override
  Widget build(BuildContext context) {
    final carros = listarCarros();

    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: carros.length,
        itemBuilder: (context, index) {
          final carro = carros[index];
          return CarroCard(
            carro: carro,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // passagem de parâmetros pelo construtor
                  builder: (context) =>
                      DetalhesPage(title: carro.nomeCompleto, carro: carro),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

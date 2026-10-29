import 'package:flutter/material.dart';

import '../../domain/models/carro.dart';
import '../widgets/carro_imagem.dart';
import '../widgets/formatadores.dart';
import 'simulacao_page.dart';

/// Tela 2: detalhes do carro (StatefulWidget com botão de favorito).
class DetalhesPage extends StatefulWidget {
  final String title;
  final Carro carro;

  const DetalhesPage({super.key, required this.title, required this.carro});

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  bool favorito = false;

  void _alternarFavorito() {
    setState(() {
      favorito = !favorito;
    });
  }

  @override
  Widget build(BuildContext context) {
    final carro = widget.carro;
    final cor = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text(widget.title), centerTitle: true),
      body: ListView(
        children: [
          CarroImagem(
            asset: carro.imagemAsset,
            width: double.infinity,
            height: 240,
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        carro.nomeCompleto,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${carro.categoria} • ${carro.ano}',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        formatarPreco(carro.preco),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: cor.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  iconSize: 36,
                  color: Colors.red,
                  tooltip: favorito ? 'Remover dos favoritos' : 'Favoritar',
                  icon: Icon(favorito ? Icons.favorite : Icons.favorite_border),
                  onPressed: _alternarFavorito,
                ),
              ],
            ),
          ),
          if (favorito)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Adicionado aos seus favoritos',
                style: TextStyle(color: Colors.red),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Chip(
                  avatar: const Icon(Icons.local_gas_station, size: 18),
                  label: Text(carro.combustivel),
                ),
                Chip(
                  avatar: const Icon(Icons.speed, size: 18),
                  label: Text('${carro.potenciaCv} cv'),
                ),
                Chip(
                  avatar: const Icon(Icons.calendar_today, size: 18),
                  label: Text('${carro.ano}'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              carro.descricao,
              style: const TextStyle(height: 1.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SimulacaoPage(carro: carro),
                  ),
                );
              },
              child: const Text('Simular financiamento'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
            child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar'),
            ),
          ),
        ],
      ),
    );
  }
}

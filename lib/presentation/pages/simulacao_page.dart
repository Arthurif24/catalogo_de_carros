import 'package:flutter/material.dart';

import '../../domain/models/carro.dart';
import '../../domain/usecases/simular_financiamento.dart';
import '../widgets/formatadores.dart';

/// Tela 3: simulação de financiamento (sliders alteram o resultado).
class SimulacaoPage extends StatefulWidget {
  final Carro carro;
  final SimularFinanciamento simular;

  const SimulacaoPage({
    super.key,
    required this.carro,
    this.simular = const SimularFinanciamento(),
  });

  @override
  State<SimulacaoPage> createState() => _SimulacaoPageState();
}

class _SimulacaoPageState extends State<SimulacaoPage> {
  double entradaPercentual = 20; // 0% a 80%
  double parcelas = 48; // 12 a 72 meses

  @override
  Widget build(BuildContext context) {
    final carro = widget.carro;
    final entrada = carro.preco * entradaPercentual / 100;
    final resultado = widget.simular(
      preco: carro.preco,
      entrada: entrada,
      parcelas: parcelas.round(),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Simulação'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            carro.nomeCompleto,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text('Preço: ${formatarPreco(carro.preco)}'),
          const SizedBox(height: 24),
          Text(
            'Entrada: ${entradaPercentual.round()}% (${formatarPreco(entrada)})',
          ),
          Slider(
            value: entradaPercentual,
            min: 0,
            max: 80,
            divisions: 8,
            label: '${entradaPercentual.round()}%',
            onChanged: (valor) {
              setState(() {
                entradaPercentual = valor;
              });
            },
          ),
          const SizedBox(height: 8),
          Text('Prazo: ${parcelas.round()} meses'),
          Slider(
            value: parcelas,
            min: 12,
            max: 72,
            divisions: 5,
            label: '${parcelas.round()}x',
            onChanged: (valor) {
              setState(() {
                parcelas = valor;
              });
            },
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${parcelas.round()}x de ${formatarPreco(resultado.parcela)}',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Valor financiado: ${formatarPreco(resultado.valorFinanciado)}',
                  ),
                  Text('Total pago: ${formatarPreco(resultado.totalPago)}'),
                  const SizedBox(height: 8),
                  Text(
                    'Simulação didática com juros de 1,5% ao mês.',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Voltar'),
          ),
        ],
      ),
    );
  }
}

import 'dart:math';

class ResultadoFinanciamento {
  final double valorFinanciado;
  final double parcela;
  final double totalPago;

  const ResultadoFinanciamento({
    required this.valorFinanciado,
    required this.parcela,
    required this.totalPago,
  });
}

/// Regra de negócio: simula um financiamento pela Tabela Price.
class SimularFinanciamento {
  /// Taxa de juros ao mês (0,015 = 1,5% a.m.). Valor didático.
  final double taxaMensal;

  const SimularFinanciamento({this.taxaMensal = 0.015});

  ResultadoFinanciamento call({
    required double preco,
    required double entrada,
    required int parcelas,
  }) {
    final financiado = preco - entrada;
    if (financiado <= 0 || parcelas <= 0) {
      return ResultadoFinanciamento(
        valorFinanciado: 0,
        parcela: 0,
        totalPago: entrada,
      );
    }

    final i = taxaMensal;
    final parcela = financiado * i / (1 - pow(1 + i, -parcelas));

    return ResultadoFinanciamento(
      valorFinanciado: financiado,
      parcela: parcela,
      totalPago: entrada + parcela * parcelas,
    );
  }
}

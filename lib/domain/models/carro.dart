class Carro {
  final int id;
  final String marca;
  final String modelo;
  final int ano;
  final double preco;
  final String categoria;
  final String combustivel;
  final int potenciaCv;
  final String descricao;

  /// Deixe vazio para mostrar o ícone de carro no lugar da foto.
  final String imagemAsset;

  const Carro({
    required this.id,
    required this.marca,
    required this.modelo,
    required this.ano,
    required this.preco,
    required this.categoria,
    required this.combustivel,
    required this.potenciaCv,
    required this.descricao,
    this.imagemAsset = '',
  });

  String get nomeCompleto => '$marca $modelo';
}

import 'package:flutter/material.dart';

/// Mostra a foto do carro; se a URL for vazia ou falhar, mostra um ícone.
class CarroImagem extends StatelessWidget {
  final String asset;
  final double? width;
  final double height;

  const CarroImagem({
    super.key,
    required this.asset,
    this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    if (asset.isEmpty) return _placeholder(context);

    return Image.asset(
      asset,
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => _placeholder(context),
    );
  }

  Widget _placeholder(BuildContext context) {
    final cor = Theme.of(context).colorScheme;
    return Container(
      width: width,
      height: height,
      color: cor.primaryContainer,
      child: Icon(
        Icons.directions_car,
        size: height * 0.5,
        color: cor.onPrimaryContainer,
      ),
    );
  }
}

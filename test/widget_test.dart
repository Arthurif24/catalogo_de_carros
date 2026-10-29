import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/main.dart';

void main() {
  testWidgets('navega da lista para detalhes e simulação, e volta', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // Tela 1: lista
    expect(find.text('Fiat Mobi'), findsOneWidget);

    // Push com parâmetro -> Tela 2
    await tester.tap(find.text('Fiat Mobi'));
    await tester.pumpAndSettle();

    // setState: favoritar muda o ícone
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    await tester.tap(find.byIcon(Icons.favorite_border));
    await tester.pump();
    expect(find.byIcon(Icons.favorite), findsOneWidget);

    // Push -> Tela 3
    await tester.scrollUntilVisible(
      find.text('Simular financiamento'),
      200,
    );
    await tester.tap(find.text('Simular financiamento'));
    await tester.pumpAndSettle();
    expect(find.text('Simulação'), findsOneWidget);

    // Pop de volta para a Tela 2 e depois para a Tela 1
    await tester.tap(find.text('Voltar'));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(find.text('Voltar'), 200);
    await tester.tap(find.text('Voltar'));
    await tester.pumpAndSettle();
    expect(find.text('Catálogo de Carros'), findsWidgets);
  });
}

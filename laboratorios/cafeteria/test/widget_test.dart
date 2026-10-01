import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cafeteria/main.dart';

void main() {
  testWidgets('Muestra el pedido correctamente', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MiPedido(),
      ),
    );

    expect(find.text('Café'), findsOneWidget);
    expect(find.text('Sándwich'), findsOneWidget);
    expect(find.text('Jugo'), findsOneWidget);
    expect(find.text('Total: Q0.00'), findsOneWidget);
  });
}
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_app/app.dart';

void main() {
  testWidgets('Home page renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    // Verifica se a AppBar existe
    expect(find.byType(AppBar), findsOneWidget);

    // Verifica se existe o campo de busca
    expect(find.byType(TextField), findsOneWidget);

    // Verifica se existem cards de produto
    expect(find.byType(GridView), findsOneWidget);
  });
}

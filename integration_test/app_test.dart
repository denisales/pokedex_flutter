import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:integration_test/common.dart';
import 'package:integration_test/integration_test.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pokedex/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Teste de integração do aplicativo', (WidgetTester tester) async {
    await app.main();
    await tester.pumpAndSettle();

    await Future.delayed(const Duration(seconds: 5));

    final titleWidget = tester.widget<Text>(find.byKey(const Key('title')));

    expect(titleWidget.data, 'Pokédex');
  });
}

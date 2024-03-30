import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pokedex/main.dart' as app;
import 'package:pokedex/src/widgets/my_card_pokemon.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Open Pokedex App and Verify Elements',
      (WidgetTester tester) async {
    app.main(); // Substitua pelo método de inicialização do seu aplicativo

    await tester.pumpAndSettle();
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();

    // Verificar se a tela está sendo acessada
    expect(find.text('Pokédex'), findsOneWidget);

    // Verificar se a lista de pokémons está sendo exibida
    expect(find.byType(MyCardPokemon), findsWidgets);

    // Clicar no botão de filtro de geração
    await tester.tap(find.byKey(const Key('filter_generation')));
    await tester.pumpAndSettle();

    // Clicar em um botão de geração
    await tester.tap(find.text('Generation II'));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();

    // Verificar se a folha inferior desapareceu
    expect(find.text('Generations'), findsNothing);
  });

  testWidgets('Test Sorting and Filtering', (WidgetTester tester) async {
    app.main(); // Substitua pelo método de inicialização do seu aplicativo

    await tester.pumpAndSettle();
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 5));

    // Clicar no botão de ordenação
    await tester.tap(find.byKey(const Key('filter_sort')));
    await tester.pumpAndSettle();

    // Clicar em "Smallest number first"
    await tester.tap(find.text('Smallest number first'));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();

    // Verificar se a folha inferior desapareceu
    expect(find.text('Sort'), findsNothing);

    // Clicar no botão de filtro
    await tester.tap(find.byKey(const Key('filter_button')));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();

    // Realizar ações de filtro aqui
    // ...

    // Verificar se a folha inferior desapareceu
    expect(find.text('Filters'), findsNothing);
  });
}

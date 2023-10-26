import 'package:flutter/material.dart';
import 'package:pokedex/src/app.dart';
import 'package:pokedex/src/graphql/graphql_client.dart';
import 'package:pokedex/src/repositories/pokemon_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => PokemonNotifier(client),
      )
    ],
    child: const App(),
  ));
}

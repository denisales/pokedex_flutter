import 'package:flutter/material.dart';
import 'package:pokedex/src/app.dart';
import 'package:pokedex/src/graphql/graphql_client.dart';
import 'package:pokedex/src/repositories/pokemon_repository.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => PokemonRepository(client),
      )
    ],
    child: const App(),
  ));
}

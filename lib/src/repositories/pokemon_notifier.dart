import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pokedex/src/models/pokemon_model.dart';

class PokemonNotifier extends ChangeNotifier {
  final GraphQLClient client;

  late List<Pokemon> _pokemons = [];

  List<Pokemon> get pokemons => _pokemons;

  PokemonNotifier(this.client) {
    _getPokemon();
  }

  _getPokemon() async {
    final QueryResult result = await client.query(QueryOptions(
      document: gql('''
        query getPokemons {
          pokemons: pokemon_v2_pokemon(
            order_by: {id: asc},
            where: {
              pokemon_v2_pokemonspecy: {
                generation_id: { _eq: 1 }
              }
            }
            limit: 150
          ) {
            name
            id
            types: pokemon_v2_pokemontypes {
              pokemon_v2_type {
                name
              }
            }
          }
        }
      '''),
    ));

    if (result.hasException) {
      throw Exception('Failed to fetch data');
    }

    _pokemons = result.data!['pokemons']
        .map<Pokemon>((pokemon) => Pokemon.fromMap(pokemon))
        .toList();

    notifyListeners();
  }
}

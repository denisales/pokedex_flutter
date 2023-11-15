import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pokedex/src/models/pokemon_model.dart';

class PokemonRepository extends ChangeNotifier {
  final GraphQLClient client;

  late List<Pokemon> _pokemons = [];

  List<Pokemon> get pokemons => _pokemons;

  PokemonRepository(this.client) {
    _getPokemons();
  }

  void _getPokemons() async {
    final QueryResult result = await client.query(QueryOptions(
      document: gql('''
       query GetPokemons {
          pokemon_v2_pokemonspecies(
            where: { generation_id: { _eq: 1 } }
            order_by: { id: asc }
          ) {
            id
            name
            pokemon_v2_pokemonspeciesnames(where: { language_id: { _eq: 9 } }) {
              name
            }
            pokemon_v2_pokemons {
              pokemon_v2_pokemontypes {
                pokemon_v2_type {
                  id
                  name
                  pokemon_v2_typenames(where: { language_id: { _eq: 9 } }) {
                    name
                  }
                }
              }
            }
          }
        }
      '''),
    ));

    if (result.hasException) {
      throw Exception('Failed to fetch data');
    }

    _pokemons = result.data!['pokemon_v2_pokemonspecies']
        .map<Pokemon>((pokemon) => Pokemon.fromMap(pokemon))
        .toList();

    notifyListeners();
  }
}

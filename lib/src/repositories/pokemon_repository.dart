import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pokedex/src/graphql/graphql_config.dart';
import 'package:pokedex/src/graphql/pokemons_querys.dart';
import 'package:pokedex/src/models/pokemon_model.dart';

class PokemonRepository extends ChangeNotifier {
  final GraphQLClient _client = GraphQlConfig.createGraphQLClient();
  late List<Pokemon> _pokemons = [];

  List<Pokemon> get pokemons => _pokemons;

  PokemonRepository() {
    _loadPokemons();
  }

  void _loadPokemons() async {
    try {
      final QueryResult response = await _client.query(
        QueryOptions(
            document: gql(PokemonsQuerys.listAllPokemons),
            fetchPolicy: FetchPolicy.noCache),
      );

      if (response.hasException) {
        throw Exception('Failed to fetch data');
      }

      _pokemons = response.data!['pokemon_v2_pokemonspecies']
          .map<Pokemon>((pokemon) => Pokemon.fromMap(pokemon))
          .toList();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    } finally {
      notifyListeners();
    }
  }
}

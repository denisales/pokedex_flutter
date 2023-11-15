import 'package:pokedex/src/models/types_model.dart';

class Pokemon {
  final int id;
  final String name;
  final List<PokemonTypes> types;
  // final Map<String, dynamic> images;

  Pokemon({
    required this.id,
    required this.name,
    required this.types,
  });

  factory Pokemon.fromMap(Map<String, dynamic> data) {
    final typeList = (data['pokemon_v2_pokemons'][0]['pokemon_v2_pokemontypes']
            as List<dynamic>)
        .cast<Map<String, dynamic>>();

    final types = typeList
        .map((typeData) => PokemonTypes(
              id: typeData['pokemon_v2_type']['id'],
              nameId: typeData['pokemon_v2_type']['name'],
              name: typeData['pokemon_v2_type']['pokemon_v2_typenames'][0]
                  ['name'],
            ))
        .toList();

    return Pokemon(
      id: data['id'],
      name: data['pokemon_v2_pokemonspeciesnames'][0]['name'],
      types: types,
    );
  }
}

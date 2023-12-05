class PokemonsQuerys {
  PokemonsQuerys._();

  static const listAllPokemons = '''
       query GetPokemons(
        \$generationId: Int = 1
        \$orderId: order_by = asc
	      \$orderName: order_by
        ) {
          pokemon_v2_pokemonspecies(
            where: { generation_id: { _eq: \$generationId } }
           order_by: { id: \$orderId, name: \$orderName }
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
      ''';
}

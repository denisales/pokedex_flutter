// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pokedex/src/enum/filter.dart';
import 'package:pokedex/src/graphql/pokemons_querys.dart';
import 'package:pokedex/src/models/pokemon_model.dart';
// import 'package:pokedex/src/repositories/pokemon_repository.dart';
import 'package:pokedex/src/utils/custom_icons.dart';
import 'package:pokedex/src/widgets/my_app_bar.dart';
import 'package:pokedex/src/widgets/my_bottom_menu_scrollable_sheet.dart';
import 'package:pokedex/src/widgets/my_button.dart';
import 'package:pokedex/src/widgets/my_button_generation.dart';
import 'package:pokedex/src/widgets/my_card_pokemon.dart';
import 'package:pokedex/src/widgets/my_text_field.dart';
// import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late OrderType _orderType = OrderType.asc;
  late OrderBy _orderBy = OrderBy.id;
  late int _generationId = 1;
  late String _searchValue = '';

  changeGeneration(int generationId) {
    setState(() {
      _generationId = generationId;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/images/backgrounds/pokeball.png'),
          fit: BoxFit.fitWidth,
          alignment: FractionalOffset.topCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MyAppBar(
          actions: [
            IconButton(
              iconSize: 25,
              color: const Color.fromRGBO(23, 23, 27, 1),
              icon: const Icon(CustomIcons.generation),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => MyBottomMenuScrollableSheet(
                    children: [
                      const Text(
                        'Generations',
                        style: TextStyle(
                          fontSize: 26,
                          color: Color.fromRGBO(23, 23, 27, 1),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Use search for generations to explore your Pokémon!',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(116, 116, 118, 1),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        mainAxisSpacing: 14,
                        crossAxisSpacing: 14,
                        childAspectRatio: (1 / .8),
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          MyButtonGeneration(
                            generationName: 'Generation I',
                            selected: _generationId == 1,
                            generationId: 1,
                            onTap: () => changeGeneration(1),
                          ),
                          MyButtonGeneration(
                            generationName: 'Generation II',
                            selected: _generationId == 2,
                            generationId: 2,
                            onTap: () => changeGeneration(2),
                          ),
                          MyButtonGeneration(
                            generationName: 'Generation III',
                            selected: _generationId == 3,
                            generationId: 3,
                            onTap: () => changeGeneration(3),
                          ),
                          MyButtonGeneration(
                            generationName: 'Generation IV',
                            selected: _generationId == 4,
                            generationId: 4,
                            onTap: () => changeGeneration(4),
                          ),
                          MyButtonGeneration(
                            generationName: 'Generation V',
                            selected: _generationId == 5,
                            generationId: 5,
                            onTap: () => changeGeneration(5),
                          ),
                          MyButtonGeneration(
                            generationName: 'Generation VI',
                            selected: _generationId == 6,
                            generationId: 6,
                            onTap: () => changeGeneration(6),
                          ),
                          MyButtonGeneration(
                            generationName: 'Generation VII',
                            selected: _generationId == 7,
                            generationId: 7,
                            onTap: () => changeGeneration(7),
                          ),
                          MyButtonGeneration(
                            generationName: 'Generation VIII',
                            selected: _generationId == 8,
                            generationId: 8,
                            onTap: () => changeGeneration(8),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                    ],
                  ),
                );
              },
            ),
            IconButton(
              iconSize: 25,
              color: const Color.fromRGBO(23, 23, 27, 1),
              icon: const Icon(CustomIcons.sort),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => MyBottomMenuScrollableSheet(
                    children: [
                      const Text(
                        'Sort',
                        style: TextStyle(
                          fontSize: 26,
                          color: Color.fromRGBO(23, 23, 27, 1),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Sort Pokémons alphabetically or by National Pokédex number!',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(116, 116, 118, 1),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      MyButton(
                        text: 'Smallest number first',
                        theme: _orderBy == OrderBy.id &&
                                _orderType == OrderType.asc
                            ? MyButtonTheme.primary
                            : MyButtonTheme.secondary,
                        onTap: () {
                          setState(() {
                            _orderType = OrderType.asc;
                            _orderBy = OrderBy.id;
                          });
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyButton(
                        text: 'Highest number first',
                        theme: _orderBy == OrderBy.id &&
                                _orderType == OrderType.desc
                            ? MyButtonTheme.primary
                            : MyButtonTheme.secondary,
                        onTap: () {
                          setState(() {
                            _orderType = OrderType.desc;
                            _orderBy = OrderBy.id;
                          });
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyButton(
                        text: 'A-Z',
                        theme: _orderBy == OrderBy.name &&
                                _orderType == OrderType.asc
                            ? MyButtonTheme.primary
                            : MyButtonTheme.secondary,
                        onTap: () {
                          setState(() {
                            _orderType = OrderType.asc;
                            _orderBy = OrderBy.name;
                          });
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyButton(
                        text: 'Z-A',
                        theme: _orderBy == OrderBy.name &&
                                _orderType == OrderType.desc
                            ? MyButtonTheme.primary
                            : MyButtonTheme.secondary,
                        onTap: () {
                          setState(() {
                            _orderType = OrderType.desc;
                            _orderBy = OrderBy.name;
                          });
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                );
              },
            ),
            IconButton(
              iconSize: 25,
              color: const Color.fromRGBO(23, 23, 27, 1),
              icon: const Icon(CustomIcons.filter),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const MyBottomMenuScrollableSheet(
                    children: [
                      Text(
                        'Filters',
                        style: TextStyle(
                          fontSize: 26,
                          color: Color.fromRGBO(23, 23, 27, 1),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Use advanced search to explore Pokémon by type, weakness, height and more!',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(116, 116, 118, 1),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      // SizedBox(
                      //   height: 1000,
                      // ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(width: 28),
          ],
        ),
        body: Container(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      key: Key('title'),
                      'Pokédex',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(23, 23, 27, 1)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Search for Pokémon by name or using the National Pokédex number.',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(116, 116, 118, 1)),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MyTextField(
                      hintText: 'What Pokémon are you looking for?',
                      prefixIcon: Icons.search,
                      onChanged: (value) => {
                        setState(() {
                          _searchValue = value;
                        })
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: _createPokemonList(
                  context: context,
                  orderBy: _orderBy,
                  orderType: _orderType,
                  generationId: _generationId,
                  searchValue: _searchValue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _createPokemonList({
  required BuildContext context,
  OrderBy? orderBy,
  OrderType? orderType,
  int? generationId,
  String? searchValue,
}) {
  Map<String, dynamic> getFilter() {
    late final filter = {
      'orderId': 'asc',
      'generationId': 1,
    };

    if (orderBy == OrderBy.name) {
      filter['orderName'] = orderType == OrderType.asc ? 'asc' : 'desc';
    }
    if (orderBy == OrderBy.id) {
      filter['orderId'] = orderType == OrderType.asc ? 'asc' : 'desc';
    }
    if (generationId != null) {
      filter['generationId'] = generationId;
    }

    if (searchValue != null) {
      filter['searchName'] = searchValue;
    }

    return filter;
  }

  return Query(
    options: QueryOptions(
      document: gql(PokemonsQuerys.listAllPokemons),
      variables: getFilter(),
      fetchPolicy: FetchPolicy.cacheFirst,
    ),
    builder: (result, {refetch, fetchMore}) {
      print('Enviou request...');
      if (result.hasException) {
        return Container(
          alignment: Alignment.center,
          child: Text(result.exception.toString()),
        );
      }

      if (result.isLoading) {
        print('Carregando dados!!!');
        return ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
          itemCount: 15,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              height: 121,
              margin: const EdgeInsets.only(top: 34),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
            );
          },
        );
      }

      List<Pokemon> pokemons = result.data!['pokemon_v2_pokemonspecies']
          .map<Pokemon>((pokemon) => Pokemon.fromMap(pokemon))
          .toList();

      if (pokemons.isEmpty) {
        return Container(
          alignment: Alignment.center,
          child: const Text('No pokemons'),
        );
      }

      print(
        'Trouxe Lista ${pokemons.length}',
      );
      return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
        itemCount: pokemons.length,
        key: ObjectKey(pokemons[0]),
        itemBuilder: (context, index) {
          final pokemon = pokemons[index];
          return MyCardPokemon(
            key: Key(pokemon.id.toString()),
            pokemon: pokemon,
          );
        },
      );
    },
  );
}

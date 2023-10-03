import 'package:flutter/material.dart';
import 'package:pokedex/src/utils/custom_icons.dart';
import 'package:pokedex/src/widgets/my_app_bar.dart';
import 'package:pokedex/src/widgets/my_bottom_menu_scrollable_sheet.dart';
import 'package:pokedex/src/widgets/my_button.dart';
import 'package:pokedex/src/widgets/my_button_generation.dart';
import 'package:pokedex/src/widgets/my_card_pokemon.dart';
import 'package:pokedex/src/widgets/my_text_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("Build HomePage");
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
                        children: const [
                          MyButtonGeneration(
                            selected: true,
                          ),
                          MyButtonGeneration(),
                          MyButtonGeneration(),
                          MyButtonGeneration(),
                          MyButtonGeneration(),
                          MyButtonGeneration(),
                          MyButtonGeneration(),
                          MyButtonGeneration(),
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
                  builder: (context) => const MyBottomMenuScrollableSheet(
                    children: [
                      Text(
                        'Sort',
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
                        'Sort Pokémons alphabetically or by National Pokédex number!',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(116, 116, 118, 1),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      MyButton(
                        text: 'Smallest number first',
                        theme: MyButtonTheme.primary,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyButton(
                        text: 'Highest number first',
                        theme: MyButtonTheme.secondary,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyButton(
                        text: 'A-Z',
                        theme: MyButtonTheme.secondary,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyButton(
                        text: 'Z-A',
                        theme: MyButtonTheme.secondary,
                      ),
                      SizedBox(
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pokédex',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(23, 23, 27, 1)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Search for Pokémon by name or using the National Pokédex number.',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(116, 116, 118, 1)),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    MyTextField(
                      hintText: 'What Pokémon are you looking for?',
                      prefixIcon: Icons.search,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.only(left: 40, right: 40, bottom: 10),
                  children: const [
                    MyCardPokemon(
                      pokemonName: 'Bulbasaur',
                      pokemonNumber: '#001',
                      color: Color.fromRGBO(139, 190, 138, 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

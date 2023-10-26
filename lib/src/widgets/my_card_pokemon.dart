import 'package:flutter/material.dart';
import 'package:pokedex/src/pages/detail_page.dart';
import 'package:pokedex/src/utils/custom_icons.dart';
import 'package:pokedex/src/widgets/my_chip.dart';

class MyCardPokemon extends StatelessWidget {
  const MyCardPokemon({
    super.key,
    required this.pokemonNumber,
    required this.pokemonName,
    required this.color,
  });

  final int pokemonNumber;
  final String pokemonName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 34),
      height: 121,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(.5),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ],
        color: color,
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage('assets/images/backgrounds/pokemon_card.png'),
          fit: BoxFit.fitHeight,
          alignment: FractionalOffset.centerRight,
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DetailPage(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      pokemonNumber < 10
                          ? '#00$pokemonNumber'
                          : pokemonNumber < 100
                              ? '#0$pokemonNumber'
                              : '#$pokemonNumber',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(23, 23, 27, .6),
                        height: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      pokemonName,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        height: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Row(
                      children: [
                        MyChip(
                          text: 'Grass',
                          icon: CustomIcons.fairy,
                          color: Color.fromRGBO(165, 82, 204, 1),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        MyChip(
                          text: 'Grass',
                          icon: CustomIcons.fairy,
                          color: Color.fromRGBO(165, 82, 204, 1),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: 130,
                height: 0,
                color: Colors.black,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -80,
                      child: Hero(
                        tag: pokemonName,
                        child: Image.network(
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$pokemonNumber.png',
                          height: 130,
                          width: 130,
                        ),
                      ),
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

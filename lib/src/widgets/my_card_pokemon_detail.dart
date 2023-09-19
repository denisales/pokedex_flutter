import 'package:flutter/material.dart';
import 'package:pokedex/src/utils/custom_icons.dart';
import 'package:pokedex/src/widgets/my_chip.dart';

class MyCardPokemonDetail extends StatelessWidget {
  const MyCardPokemonDetail({super.key});

  @override
  Widget build(BuildContext context) {
    print('Build MyCardPokemonDetail');
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/backgrounds/pokemon_detail_circle.png'),
              fit: BoxFit.fitWidth,
              alignment: FractionalOffset.topCenter,
            ),
          ),
          child: const Hero(
            tag: 'teste',
            child: Image(
              image: AssetImage('assets/images/pokemon.png'),
              width: 125,
              height: 125,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '#001',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(23, 23, 27, .6),
                // height: 1,
              ),
            ),
            Text(
              'Bulbasaur',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                // height: 1,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
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
      ],
    );
  }
}

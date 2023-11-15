import 'package:flutter/material.dart';
import 'package:pokedex/src/models/pokemon_model.dart';
import 'package:pokedex/src/models/types_model.dart';
import 'package:pokedex/src/pages/detail_page.dart';
import 'package:pokedex/src/utils/custom_icons.dart';
import 'package:pokedex/src/widgets/my_chip.dart';

class MyCardPokemonDetail extends StatelessWidget {
  const MyCardPokemonDetail({super.key, required this.pokemon});

  final Pokemon pokemon;

  int getBackgroundTypeColor(PokemonTypes type) {
    late int color;

    switch (type.nameId) {
      case 'fire':
        color = 0xffFFA756;
        break;
      case 'bug':
        color = 0xff8BD674;
        break;
      case 'dark':
        color = 0xff6F6E78;
        break;
      case 'dragon':
        color = 0xff7383B9;
        break;
      case 'electric':
        color = 0xffF2CB55;
        break;
      case 'fairy':
        color = 0xffEBA8C3;
        break;
      case 'fighting':
        color = 0xffEB4971;
        break;
      case 'flying':
        color = 0xff83A2E3;
        break;
      case 'ghost':
        color = 0xff8571be;
        break;
      case 'ground':
        color = 0xfff78551;
        break;
      case 'ice':
        color = 0xff91d8df;
        break;
      case 'normal':
        color = 0xffb5b9c4;
        break;
      case 'poison':
        color = 0xff9f6e97;
        break;
      case 'psychic':
        color = 0xffff6568;
        break;
      case 'rock':
        color = 0xffd4c294;
        break;
      case 'steel':
        color = 0xff4c91b2;
        break;
      case 'water':
        color = 0xff58abf6;
        break;
      case 'grass':
        color = 0xff88be8a;
        break;
      default:
        color = 0xff000000;
        break;
    }

    return color;
  }

  int getTypeColor(PokemonTypes type) {
    late int color;

    switch (type.nameId) {
      case 'fire':
        color = 0xfffd7d24;
        break;
      case 'bug':
        color = 0xff8cb230;
        break;
      case 'dark':
        color = 0xff58575f;
        break;
      case 'dragon':
        color = 0xff0f6ac0;
        break;
      case 'electric':
        color = 0xffeed535;
        break;
      case 'fairy':
        color = 0xffed6ec7;
        break;
      case 'fighting':
        color = 0xffd04164;
        break;
      case 'flying':
        color = 0xff748fc9;
        break;
      case 'ghost':
        color = 0xff556aae;
        break;
      case 'ground':
        color = 0xffdd7748;
        break;
      case 'ice':
        color = 0xff61c3c0;
        break;
      case 'normal':
        color = 0xff9da0aa;
        break;
      case 'poison':
        color = 0xffa552cc;
        break;
      case 'psychic':
        color = 0xffea5d60;
        break;
      case 'rock':
        color = 0xffbaab82;
        break;
      case 'steel':
        color = 0xff417d91;
        break;
      case 'water':
        color = 0xff4a90da;
        break;
      case 'grass':
        color = 0xff62b957;
        break;
      default:
        color = 0xff000000;
        break;
    }

    return color;
  }

  IconData getTypeIcon(PokemonTypes type) {
    late IconData icon;

    switch (type.nameId) {
      case 'fire':
        icon = CustomIcons.fire;
        break;
      case 'bug':
        icon = CustomIcons.fairy;
        break;
      case 'dark':
        icon = CustomIcons.fairy;
        break;
      case 'dragon':
        icon = CustomIcons.dragon;
        break;
      case 'electric':
        icon = CustomIcons.electric;
        break;
      case 'fairy':
        icon = CustomIcons.fairy;
        break;
      case 'fighting':
        icon = CustomIcons.fighting;
        break;
      case 'flying':
        icon = CustomIcons.flying;
        break;
      case 'ghost':
        icon = CustomIcons.fairy;
        break;
      case 'ground':
        icon = CustomIcons.ground;
        break;
      case 'ice':
        icon = CustomIcons.ice;
        break;
      case 'normal':
        icon = CustomIcons.normal;
        break;
      case 'poison':
        icon = CustomIcons.poison;
        break;
      case 'psychic':
        icon = CustomIcons.psychic;
        break;
      case 'rock':
        icon = CustomIcons.rock;
        break;
      case 'steel':
        icon = CustomIcons.steel;
        break;
      case 'water':
        icon = CustomIcons.water;
        break;
      case 'grass':
        icon = CustomIcons.grass;
        break;
      default:
        icon = CustomIcons.fairy;
        break;
    }

    return icon;
  }

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
          child: Hero(
            tag: pokemon.name,
            child: Image.network(
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemon.id}.png',
              height: 125,
              width: 125,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              (() {
                if (pokemon.id < 10) {
                  return '#00${pokemon.id}';
                } else if (pokemon.id < 100) {
                  return '#0${pokemon.id}';
                } else {
                  return '#${pokemon.id}';
                }
              })(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(23, 23, 27, .6),
                // height: 1,
              ),
            ),
            Text(
              pokemon.name,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                // height: 1,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                ...pokemon.types.map(
                  (type) => Container(
                    padding: const EdgeInsets.only(right: 5),
                    child: MyChip(
                      key: Key(type.id.toString()),
                      text: type.name,
                      icon: getTypeIcon(type),
                      color: Color(getTypeColor(type)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

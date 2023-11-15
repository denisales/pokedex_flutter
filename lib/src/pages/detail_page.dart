import 'package:flutter/material.dart';
import 'package:pokedex/src/models/pokemon_model.dart';
import 'package:pokedex/src/models/types_model.dart';
import 'package:pokedex/src/widgets/my_app_bar.dart';
import 'package:pokedex/src/widgets/my_card_pokemon_detail.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late double _position = 0;
  late double _tabAnimationValue = 0.0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
      animationDuration: const Duration(milliseconds: 200),
    );

    _tabController.animation!.addListener(() {
      setState(() {
        _tabAnimationValue = _tabController.animation!.value;
      });
    });
  }

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

  @override
  Widget build(BuildContext context) {
    print("Build DetailPage");
    return Container(
      decoration: BoxDecoration(
        color: Color(getBackgroundTypeColor(widget.pokemon.types[0])),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 0),
            curve: Curves.linear,
            right: 0,
            top: 195 - (_position * 150),
            child: Container(
              height: 65,
              width: 65,
              decoration: const BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/backgrounds/pokemon_detail_pattern.png'),
                  fit: BoxFit.fitHeight,
                  alignment: FractionalOffset.topLeft,
                ),
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: MyAppBar(
              title: AnimatedOpacity(
                opacity: _position == 1 ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: Text(
                  widget.pokemon.name,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    // height: 1,
                  ),
                ),
              ),
              leading: IconButton(
                // padding: const EdgeInsets.only(left: 25),
                color: Colors.white,
                icon: const Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: SlidingUpPanel(
              color: Colors.transparent,
              boxShadow: const [
                BoxShadow(color: Colors.transparent),
              ],
              onPanelSlide: (position) {
                setState(() {
                  _position = position;
                });
              },
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              minHeight: (MediaQuery.of(context).size.height + 40) / 100 * 66,
              maxHeight: (MediaQuery.of(context).size.height + 40) / 100 * 82,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Opacity(
                      opacity: 1 - _position,
                      child: MyCardPokemonDetail(pokemon: widget.pokemon))
                ],
              ),
              panel: Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    child: Stack(
                      children: [
                        AnimatedAlign(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.linear,
                          alignment: FractionalOffset(
                              1 / (3 - 1) * _tabAnimationValue, 0),
                          child: FractionallySizedBox(
                            widthFactor: 1 / 3,
                            child: Center(
                              child: Container(
                                width: 100,
                                decoration: const BoxDecoration(
                                  // color: Colors.orange,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/backgrounds/pokeball_tabs.png'),
                                    fit: BoxFit.fitWidth,
                                    alignment: FractionalOffset.topCenter,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        TabBar(
                          controller: _tabController,
                          labelStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                          unselectedLabelStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withOpacity(0.4),
                          ),
                          indicator: const UnderlineTabIndicator(
                              borderSide: BorderSide.none),
                          tabs: const [
                            Tab(
                              child: Text('About'),
                            ),
                            Tab(
                              child: Text('Stats'),
                            ),
                            Tab(
                              child: Text('Evolution'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: const Offset(0, 5),
                          ),
                        ],
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(40),
                            child: const Text('page 1'),
                          ),
                          Container(
                            padding: const EdgeInsets.all(40),
                            child: const Text('page 2'),
                          ),
                          Container(
                            padding: const EdgeInsets.all(40),
                            child: const Text('page 3'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
//   int index = 0;

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return LayoutBuilder(builder: (context, constraints) {
//       final Color color = Colors.primaries[index];
//       final double percentage =
//           (constraints.maxHeight - minExtent) / (maxExtent - minExtent);

//       if (++index > Colors.primaries.length - 1) index = 0;

//       return Container(
//         decoration: BoxDecoration(
//           boxShadow: const [
//             BoxShadow(
//               blurRadius: 4.0,
//               color: Colors.black45,
//             ),
//           ],
//           gradient: LinearGradient(
//             colors: [Colors.blue, color],
//           ),
//         ),
//         height: constraints.maxHeight,
//         child: SafeArea(
//             child: Center(
//           child: CircularProgressIndicator(
//             value: percentage,
//             valueColor: const AlwaysStoppedAnimation(
//               Colors.white,
//             ),
//           ),
//         )),
//       );
//     });
//   }

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

//   @override
//   double get maxExtent => 250.0;

//   @override
//   double get minExtent => 80.0;
// }

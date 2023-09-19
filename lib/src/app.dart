import 'package:flutter/material.dart';
import 'package:pokedex/src/pages/home_page.dart';
// import 'package:pokedex/pages/detail_page.dart';

// import 'package:pokedex/pages/teste.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

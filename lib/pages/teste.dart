import 'package:flutter/material.dart';
import 'package:pokedex/widgets/my_app_bar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final heightContent = MediaQuery.of(context).size.height -
        const MyAppBar().appBarHeight -
        MediaQuery.of(context).padding.top -
        100;

    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(139, 190, 138, 1),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MyAppBar(
          leading: IconButton(
            color: Colors.white,
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {},
          ),
        ),
        body: DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.7,
          maxChildSize: 0.88,
          snap: true,
          builder: (BuildContext context, ScrollController scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Container(
                height: heightContent,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                // padding: EdgeInsets.all(20),
                child: const Column(
                  children: [
                    Text('teste'),
                    Text('teste'),
                    Text('teste'),
                    Text('teste'),
                    Text('teste'),
                    Text('teste'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

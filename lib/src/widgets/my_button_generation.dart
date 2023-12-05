import 'package:flutter/material.dart';

class MyButtonGeneration extends StatelessWidget {
  const MyButtonGeneration({
    super.key,
    this.selected = false,
    this.generationId = 1,
    this.onTap,
    required this.generationName,
  });

  final bool selected;
  final int generationId;
  final String generationName;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: selected ? 10 : 0,
      shadowColor: selected ? const Color.fromRGBO(234, 93, 96, 0.30) : null,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          height: 129,
          decoration: BoxDecoration(
            color: selected
                ? const Color.fromRGBO(234, 93, 96, 1)
                : const Color.fromRGBO(242, 242, 242, 1),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            image: const DecorationImage(
              image:
                  AssetImage('assets/images/backgrounds/generation_card.png'),
              fit: BoxFit.fill,
              alignment: FractionalOffset.center,
            ),
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/generation_$generationId.png'),
                width: 125,
                height: 45,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                generationName,
                style: TextStyle(
                  fontSize: 16,
                  color: selected
                      ? Colors.white
                      : const Color.fromRGBO(116, 116, 118, 1),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

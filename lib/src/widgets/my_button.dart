import 'package:flutter/material.dart';

enum MyButtonTheme { primary, secondary }

final Map<MyButtonTheme, Color> _textTheme = {
  MyButtonTheme.primary: Colors.white,
  MyButtonTheme.secondary: const Color.fromRGBO(116, 116, 118, 1),
};

final Map<MyButtonTheme, Color> _themeColor = {
  MyButtonTheme.primary: const Color.fromRGBO(234, 93, 96, 1),
  MyButtonTheme.secondary: const Color.fromRGBO(242, 242, 242, 1),
};

final Map<MyButtonTheme, Color> _shadowColor = {
  MyButtonTheme.primary: const Color.fromRGBO(234, 93, 96, 0.30),
  MyButtonTheme.secondary: Colors.transparent,
};

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    this.theme = MyButtonTheme.primary,
    required this.text,
  });

  final MyButtonTheme? theme;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _themeColor[theme],
      borderRadius: BorderRadius.circular(10),
      elevation: 10,
      shadowColor: _shadowColor[theme],
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          print(text);
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1,
              color: _textTheme[theme],
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

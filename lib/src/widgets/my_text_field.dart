import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.controller,
    this.onChanged,
  });

  final String? hintText;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: const Color.fromRGBO(23, 23, 27, 1),
      autocorrect: false,
      onChanged: onChanged,
      enableSuggestions: false,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      style: const TextStyle(
        color: Color.fromRGBO(23, 23, 27, 1),
        fontSize: 16,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none,
      ),
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: const Color.fromRGBO(116, 116, 118, 1),
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        hintStyle: const TextStyle(
          color: Color.fromRGBO(116, 116, 118, 1),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        hintText: hintText,
        filled: true,
        fillColor: const Color.fromRGBO(242, 242, 242, 1),
      ),
    );
  }
}

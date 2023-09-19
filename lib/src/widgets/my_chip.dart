import 'package:flutter/material.dart';

class MyChip extends StatelessWidget {
  const MyChip({
    super.key,
    required this.text,
    required this.icon,
    required this.color,
  });

  final String text;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    print("Build MyChip");
    return Container(
      height: 25,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 15,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              height: 1,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

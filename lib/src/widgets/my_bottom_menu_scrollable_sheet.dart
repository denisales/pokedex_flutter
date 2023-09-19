import 'package:flutter/material.dart';

class MyBottomMenuScrollableSheet extends StatelessWidget {
  const MyBottomMenuScrollableSheet({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    Widget makeDismissible({required Widget child}) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.of(context).pop(),
          child: GestureDetector(
            onTap: () {},
            child: child,
          ),
        );

    return makeDismissible(
      child: DraggableScrollableSheet(
        // expand: false,
        initialChildSize: 0.46,
        maxChildSize: 0.90,
        minChildSize: 0.46,
        snap: true,
        builder: (_, controller) => Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 6),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(3)),
              ),
              width: 80,
              height: 6,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
                child: ListView(
                  shrinkWrap: true,
                  controller: controller,
                  children: children,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

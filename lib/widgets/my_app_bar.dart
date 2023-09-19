import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:pokedex/presentation/custom_icons.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, this.actions, this.title, this.leading});

  final double appBarHeight = 74;
  final List<Widget>? actions;
  final Widget? title;
  final Widget? leading;

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 90,
      centerTitle: true,
      systemOverlayStyle: const SystemUiOverlayStyle(
        // statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        // statusBarIconBrightness: Brightness.light,
      ),
      elevation: 0,
      toolbarHeight: appBarHeight,
      backgroundColor: Colors.transparent,
      leading: leading,
      title: title,
      actions: actions,
    );
  }
}

import 'package:flashcoders/global_components/app_bar/logo_with_text.dart';
import 'package:flashcoders/global_components/app_bar/nav_bar.dart';
import 'package:flutter/material.dart';

class XAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  const XAppBar({this.backgroundColor, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      leading: const SizedBox(),
      toolbarHeight: 110,
      elevation: 0,
      automaticallyImplyLeading: false,
      surfaceTintColor: backgroundColor,
      bottomOpacity: 0.5,
      title: const Padding(
        padding: EdgeInsets.only(left: 100.0, right: 160, top: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LogoWithText(),
            // NavBar(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(110);
}

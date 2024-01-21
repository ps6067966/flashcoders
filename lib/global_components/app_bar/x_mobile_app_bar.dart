import 'package:flashcoders/global_components/app_bar/logo_with_text.dart';
import 'package:flutter/material.dart';

class XMobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  const XMobileAppBar({this.backgroundColor, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      leading: const SizedBox(),
      toolbarHeight: 70,
      elevation: 0,
      leadingWidth: 10,
      actions: [
        InkWell(
          onTap: () {
            Scaffold.of(context).openEndDrawer();
          },
          child: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 20),
      ],
      centerTitle: false,
      title: const LogoWithText(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

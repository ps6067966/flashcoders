import 'package:flashcoders/global_components/custom_app_bar/logo_with_text.dart';
import 'package:flashcoders/global_components/custom_app_bar/nav_bar.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 110,
      elevation: 0,
      title: const Padding(
        padding: EdgeInsets.only(left: 160.0, right: 160, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LogoWithText(),
            NavBar(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(130);
}

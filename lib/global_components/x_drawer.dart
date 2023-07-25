import 'package:flashcoders/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/flutter-institute/desktop_components/flutter_institute_nav_text_btn.dart';

class XDrawer extends StatelessWidget {
  const XDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:
          GoRouterState.of(context).uri.toString().contains("flutter-institute")
              ? AppColors.primaryBlackColor
              : Colors.white,
      child: const Column(
        children: [
          SizedBox(
            height: 50,
          ),
          FlutterInstituteNavTextButton(),
        ],
      ),
    );
  }
}

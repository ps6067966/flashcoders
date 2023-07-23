import 'package:flutter/material.dart';

import '../features/flutter-institute/components/flutter_institute_nav_text_btn.dart';

class XDrawer extends StatelessWidget {
  const XDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
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

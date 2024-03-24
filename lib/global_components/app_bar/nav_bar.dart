import 'package:flashcoders/features/flutter-institute/desktop_components/flutter_institute_nav_text_btn.dart';
import 'package:flutter/material.dart';

import '../../features/admin/components/admin_panel_nav_text_btn.dart';
import '../../features/auth/desktop_component/sign_in_button.dart';
import '../../features/blog/desktop_component/blog_nav_text_btn.dart';
import '../../features/documentation/components/docs_nav_text_btn.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        AdminPanelNavTextButton(),
        FlutterInstituteNavTextButton(),
        DocsNavTextButton(),
        SizedBox(
          width: 24,
        ),
        BlogNavTextButton(),
        SizedBox(
          width: 24,
        ),
        SignInButton(),
      ],
    );
  }
}

import 'package:flashcoders/features/flutter-institute/components/flutter_institute_nav_text_btn.dart';
import 'package:flashcoders/features/marketplace/component/marketplace_nav_text_btn.dart';
import 'package:flutter/material.dart';

import '../../features/admin/components/admin_panel_nav_text_btn.dart';
import '../../features/auth/component/sign_in_button.dart';
import '../../features/blog/component/blog_nav_text_btn.dart';
import '../../features/documentation/components/docs_nav_text_btn.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AdminPanelNavTextButton(),
        const FlutterInstituteNavTextButton(),
        const MarketplaceNavTextButton(),
        const SizedBox(
          width: 24,
        ),
        const DocsNavTextButton(),
        const SizedBox(
          width: 24,
        ),
        const BlogNavTextButton(),
        const SizedBox(
          width: 24,
        ),
        SignInButton(),
      ],
    );
  }
}

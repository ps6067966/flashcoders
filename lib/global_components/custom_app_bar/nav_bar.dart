import 'package:flutter/material.dart';

import '../../features/auth/component/sign_in_button.dart';
import '../../features/blog/component/blog_nav_text_btn.dart';
import '../../features/documentation/components/docs_nav_text_btn.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
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

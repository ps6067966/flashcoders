import 'package:flashcoders/features/documentation/documentation_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/blog/blog_router.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            context.pushReplacement(docPath);
          },
          child: const Text(
            "Docs",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        InkWell(
          onTap: () {
            context.pushReplacement(blogPath);
          },
          child: const Text(
            "Blogs",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}

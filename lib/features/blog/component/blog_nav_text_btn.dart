import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../blog_router.dart';

class BlogNavTextButton extends StatelessWidget {
  const BlogNavTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushReplacementNamed(blogPath);
      },
      child: const Text(
        "Blogs",
        style: TextStyle(
          fontSize: 17,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../blog_router.dart';

class BlogNavTextButton extends StatelessWidget {
  const BlogNavTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushReplacementNamed(BlogPath.blog);
      },
      child: Text(
        "Blogs",
        style: TextStyle(
          fontSize: 17,
          color: GoRouterState.of(context)
                  .uri
                  .toString()
                  .contains("flutter-institute")
              ? Colors.white
              : Colors.black,
        ),
      ),
    );
  }
}

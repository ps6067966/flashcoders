import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../documentation_router.dart';

class DocsNavTextButton extends StatelessWidget {
  const DocsNavTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushReplacementNamed(docPath);
      },
      child: const Text(
        "Docs",
        style: TextStyle(
          fontSize: 17,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
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
          onTap: () {},
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

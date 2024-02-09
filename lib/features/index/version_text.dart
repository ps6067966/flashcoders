import 'package:flutter/material.dart';

class VersionText extends StatelessWidget {
  const VersionText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Version 1.2.3",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 16,
        ),
      ],
    );
  }
}

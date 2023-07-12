import 'package:flutter/material.dart';

import 'custom_app_bar_assets.dart';

class LogoWithText extends StatelessWidget {
  const LogoWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          flashCodersLogo,
          height: 55,
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
          "Flash Coders",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

import 'package:flashcoders/features/index/index_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'custom_app_bar_assets.dart';

class LogoWithText extends StatelessWidget {
  const LogoWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushReplacement(indexPath);
      },
      child: Row(
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
      ),
    );
  }
}

import 'package:flashcoders/features/index/index_router.dart';
import 'package:flashcoders/global/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

class LogoWithText extends StatelessWidget {
  const LogoWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushReplacementNamed(indexPath);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppAssets.flashCodersLogo,
            height: ResponsiveBreakpoints.of(context).isMobile ? 40 : 55,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "Flash Coders",
            style: TextStyle(
              color: GoRouterState.of(context)
                      .uri
                      .toString()
                      .contains("flutter-institute")
                  ? Colors.white
                  : Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

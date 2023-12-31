import 'package:flashcoders/features/index/enquire_now_form.dart';
import 'package:flashcoders/features/marketplace/marketplace_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_colors.dart';
import '../index_assets.dart';
import '../index_text.dart';

class MHeroSection extends StatelessWidget {
  const MHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          child: Text(
            IndexText.mainHeading,
            style: GoogleFonts.robotoFlex().copyWith(
              fontSize: 24,
              letterSpacing: 1.3,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(IndexAssets.heroGif, height: 150),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        AnimatedButton(
          onPress: () async {
            await Future.delayed(
              const Duration(milliseconds: 500),
              () => null,
            );
            if (context.mounted) {
              context.push(MarketPlacePath.marketplace);
            }
          },
          width: 240,
          height: 45,
          text: "Deploy Apps and Websites",
          selectedTextColor: AppColors.primaryBlackColor,
          backgroundColor: AppColors.primaryBlackColor,
          transitionType: TransitionType.LEFT_TO_RIGHT,
          textStyle: const TextStyle(
            fontSize: 16,
            letterSpacing: 1.2,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}

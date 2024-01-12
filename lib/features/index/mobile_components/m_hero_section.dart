import 'package:flashcoders/features/marketplace/marketplace_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_colors.dart';
import '../index_text.dart';

class MHeroSection extends StatelessWidget {
  const MHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          child: Text(
            IndexText.mainHeading,
            style: GoogleFonts.robotoFlex().copyWith(
              fontSize: 18,
              letterSpacing: 1.1,
              fontWeight: FontWeight.w500,
              color: Colors.white,
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
            Image.asset("assets/images/ar.png", height: 150),
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
          borderRadius: 40,
          selectedTextColor: AppColors.primaryBlackColor,
          backgroundColor: const Color(0xff4effff),
          transitionType: TransitionType.LEFT_TO_RIGHT,
          textStyle: const TextStyle(
            fontSize: 14,
            letterSpacing: 1.2,
            color: Colors.black,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}

import 'package:flashcoders/features/index/enquire_now_form.dart';
import 'package:flashcoders/features/index/index_assets.dart';
import 'package:flashcoders/features/index/index_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_colors.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 160,
        right: 160,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 600,
                child: Text(
                  IndexText.mainHeading,
                  style: GoogleFonts.robotoFlex().copyWith(
                    fontSize: 44,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              AnimatedButton(
                onPress: () async {
                  await Future.delayed(
                    const Duration(milliseconds: 500),
                    () => null,
                  );
                  if (context.mounted) {
                    EnquireForm.showEnquireNowForm(context);
                  }
                },
                width: 200,
                height: 60,
                text: "Enquire Now",
                selectedTextColor: AppColors.primaryBlackColor,
                backgroundColor: AppColors.primaryBlackColor,
                transitionType: TransitionType.LEFT_TO_RIGHT,
                textStyle: const TextStyle(
                  fontSize: 20,
                  letterSpacing: 1.2,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Image.asset(IndexAssets.heroGif, height: 500),
        ],
      ),
    );
  }
}

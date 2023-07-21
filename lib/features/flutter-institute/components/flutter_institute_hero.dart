import 'package:flashcoders/features/flutter-institute/flutter_institute_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_colors.dart';

class FlutterInstituteHero extends StatelessWidget {
  const FlutterInstituteHero({super.key});

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
                  "Hands-on Flutter Learning Experience",
                  style: GoogleFonts.robotoFlex().copyWith(
                    fontSize: 44,
                    letterSpacing: 1.2,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: 600,
                child: Text(
                  "Stay up to date with the latest technologies",
                  style: GoogleFonts.robotoFlex().copyWith(
                    fontSize: 20,
                    color: Colors.white,
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
                },
                width: 200,
                height: 60,
                text: "🔒 Enroll Now",
                selectedTextColor: AppColors.primaryBlackColor,
                backgroundColor: Colors.white,
                transitionType: TransitionType.LEFT_TO_RIGHT,
                textStyle: const TextStyle(
                  fontSize: 20,
                  letterSpacing: 1.2,
                  color: AppColors.primaryBlackColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 150.0),
            child: Image.asset(
              FlutterInstituteAssets.technology,
              height: 500,
            ),
          ),
        ],
      ),
    );
  }
}

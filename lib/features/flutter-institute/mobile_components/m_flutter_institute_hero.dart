import 'package:flashcoders/features/flutter-institute/flutter_institute_assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../desktop_components/enroll_now_button.dart';

class MFlutterInstituteHero extends StatelessWidget {
  const MFlutterInstituteHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Hands-on Flutter Learning Experience",
              style: GoogleFonts.robotoFlex().copyWith(
                fontSize: 28,
                letterSpacing: 1.2,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Go from zero to pro in just 3 months",
              style: GoogleFonts.robotoFlex().copyWith(
                fontSize: 16,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            Image.asset(
              FlutterInstituteAssets.technology,
              height: 200,
            ),
            const SizedBox(
              height: 60,
            ),
            const EnrollNowButton(),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "* Limited seat available, Hurry Up!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

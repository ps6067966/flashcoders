import 'package:flashcoders/features/flutter-institute/flutter_institute_assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'enroll_now_button.dart';

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
                  "Go from zero to pro in just 3 months",
                  style: GoogleFonts.robotoFlex().copyWith(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
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

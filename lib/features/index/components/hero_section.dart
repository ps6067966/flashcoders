import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../global/app_assets.dart';
import '../../../theme/app_colors.dart';
import '../../documentation/documentation_router.dart';

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
                  "Great Product at lightening speed, faster than ever before",
                  style: GoogleFonts.robotoFlex().copyWith(
                    fontSize: 44,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  fixedSize: const Size.fromHeight(60),
                  foregroundColor: Colors.white,
                  backgroundColor: AppColors.primaryBlackColor,
                ),
                onPressed: () {
                  context.pushNamed(docPath);
                },
                child: const Text(
                  "Documentation",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
          Image.asset(AppAssets.heroGif, height: 500),
        ],
      ),
    );
  }
}

import 'package:flashcoders/features/documentation/documentation_router.dart';
import 'package:flashcoders/global/app_assets.dart';
import 'package:flashcoders/global_components/custom_app_bar/custom_app_bar.dart';
import 'package:flashcoders/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
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
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
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
          ),
        ],
      ),
    );
  }
}

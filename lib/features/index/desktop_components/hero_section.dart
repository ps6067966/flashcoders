import 'package:flashcoders/features/index/index_text.dart';
import 'package:flashcoders/features/marketplace/marketplace_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 160,
        right: 160,
        bottom: 40,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 600,
                  child: Text(
                    IndexText.mainHeading,
                    style: GoogleFonts.robotoFlex().copyWith(
                      fontSize: 34,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w500,
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
                    if (context.mounted) {
                      context.push(MarketPlacePath.marketplace);
                    }
                  },
                  borderRadius: 40,
                  width: 300,
                  height: 60,
                  text: "Deploy Apps and Websites",
                  selectedTextColor: Colors.black,
                  backgroundColor: const Color(0xff4effff),
                  transitionType: TransitionType.LEFT_TO_RIGHT,
                  textStyle: const TextStyle(
                    fontSize: 20,
                    letterSpacing: 1.2,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: Image.asset(
            "assets/images/ar.png",
            height: 450,
          )),
        ],
      ),
    );
  }
}

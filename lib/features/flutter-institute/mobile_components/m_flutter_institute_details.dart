import 'package:flashcoders/features/flutter-institute/flutter_institute_assets.dart';
import 'package:flashcoders/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MFlutterInstituteDetails extends StatelessWidget {
  const MFlutterInstituteDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 40,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "In Partnership with  ",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            InkWell(
              onTap: () {
                launchUrl(Uri.parse("https://www.oprezoindia.com/"));
              },
              child: const Text(
                "Oprezo India Private Limited  ↗️",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Launching India's first platform where focus is on practical skill-based learning rather than theory-based",
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            decoration: TextDecoration.underline,
            decorationColor: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 40,
        ),
        Image.asset(
          FlutterInstituteAssets.instituteOffer,
          height: 300,
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}

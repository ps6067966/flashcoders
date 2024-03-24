import 'package:flashcoders/features/flutter-institute/flutter_institute_assets.dart';
import 'package:flutter/material.dart';

class FlutterInstituteDetails extends StatelessWidget {
  const FlutterInstituteDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     const Text(
        //       "In Partnership with  ",
        //       style: TextStyle(
        //         fontSize: 30,
        //         color: Colors.white,
        //       ),
        //       textAlign: TextAlign.center,
        //     ),
        //     InkWell(
        //       onTap: () {
        //         launchUrl(Uri.parse("https://www.oprezoindia.com/"));
        //       },
        //       child: const Text(
        //         "Oprezo India Private Limited  ↗️",
        //         style: TextStyle(
        //           fontSize: 30,
        //           color: AppColors.primaryColor,
        //         ),
        //         textAlign: TextAlign.center,
        //       ),
        //     ),
        //   ],
        // ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Launching India's first platform where focus is on practical skill-based learning rather than theory-based",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            decoration: TextDecoration.underline,
            decorationColor: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 30,
        ),
        Image.asset(
          FlutterInstituteAssets.instituteOffer,
          height: 500,
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}

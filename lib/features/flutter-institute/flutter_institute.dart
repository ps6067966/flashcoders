import 'package:flashcoders/global_components/app_bar/custom_app_bar.dart';
import 'package:flashcoders/global_components/footer/footer.dart';
import 'package:flashcoders/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'components/flutter_institute_details.dart';
import 'components/flutter_institute_hero.dart';

class FlutterInstituteScreen extends StatelessWidget {
  const FlutterInstituteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryBlackColor,
      appBar: CustomAppBar(backgroundColor: AppColors.primaryBlackColor),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FlutterInstituteHero(),
            FlutterInstituteDetails(),
            Footer(),
          ],
        ),
      ),
    );
  }
}

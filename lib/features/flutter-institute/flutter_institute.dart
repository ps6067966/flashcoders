import 'package:flashcoders/global_components/app_bar/x_app_bar.dart';
import 'package:flashcoders/global_components/footer/footer.dart';
import 'package:flashcoders/global_components/xresponsive_wrapper.dart';
import 'package:flashcoders/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'desktop_components/flutter_institute_details.dart';
import 'desktop_components/flutter_institute_hero.dart';
import 'm_flutter_institute_screen.dart';

class FlutterInstituteScreen extends StatelessWidget {
  const FlutterInstituteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const XResponsiveWrapper(
      mobile: MFlutterInstituteScreen(),
      desktop: Scaffold(
        backgroundColor: AppColors.primaryBlackColor,
        appBar: XAppBar(backgroundColor: AppColors.primaryBlackColor),
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
      ),
    );
  }
}

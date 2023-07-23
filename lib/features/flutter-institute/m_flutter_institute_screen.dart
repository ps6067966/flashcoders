import 'package:flashcoders/global_components/footer/footer.dart';
import 'package:flashcoders/global_components/x_drawer.dart';
import 'package:flashcoders/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../global_components/app_bar/x_mobile_app_bar.dart';
import 'mobile_components/m_flutter_institute_details.dart';
import 'mobile_components/m_flutter_institute_hero.dart';

class MFlutterInstituteScreen extends StatelessWidget {
  const MFlutterInstituteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryBlackColor,
      appBar: XMobileAppBar(backgroundColor: AppColors.primaryBlackColor),
      endDrawer: XDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  MFlutterInstituteHero(),
                  MFlutterInstituteDetails(),
                ],
              ),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}

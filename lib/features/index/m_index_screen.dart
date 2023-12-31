import 'package:flashcoders/features/index/version_text.dart';
import 'package:flashcoders/global_components/footer/footer.dart';
import 'package:flutter/material.dart';

import '../../global_components/app_bar/x_mobile_app_bar.dart';
import '../../global_components/x_drawer.dart';
import 'mobile_components/m_hero_section.dart';
import 'mobile_components/m_product_management.dart';
import 'mobile_components/m_technology_stack.dart';

class MIndexScreen extends StatelessWidget {
  const MIndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: XMobileAppBar(),
      endDrawer: XDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MHeroSection(),
                  MTechnologyStack(),
                  MProductManagementImage(),
                ],
              ),
            ),
            VersionText(),
            Footer(),
          ],
        ),
      ),
    );
  }
}

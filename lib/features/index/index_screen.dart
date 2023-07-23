import 'package:flashcoders/features/index/desktop_components/hero_section.dart';
import 'package:flashcoders/features/index/desktop_components/technology_stack.dart';
import 'package:flashcoders/global_components/app_bar/x_app_bar.dart';
import 'package:flashcoders/global_components/floating_action_button.dart';
import 'package:flashcoders/global_components/xresponsive_wrapper.dart';
import 'package:flutter/material.dart';

import '../../global_components/footer/footer.dart';
import 'desktop_components/product_management.dart';
import 'm_index_screen.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const XResponsiveWrapper(
      mobile: MIndexScreen(),
      desktop: Scaffold(
        appBar: XAppBar(),
        floatingActionButton: XFloatingActionButton(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeroSection(),
              TechnologyStack(),
              ProductManagementImage(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flashcoders/features/index/components/hero_section.dart';
import 'package:flashcoders/features/index/components/technology_stack.dart';
import 'package:flashcoders/global_components/custom_app_bar/custom_app_bar.dart';
import 'package:flashcoders/global_components/floating_action_button.dart';
import 'package:flutter/material.dart';

import '../../global_components/footer/footer.dart';
import 'components/product_management.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
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
    );
  }
}

import 'package:flashcoders/features/index/components/hero_section.dart';
import 'package:flashcoders/features/index/components/technology_stack.dart';
import 'package:flashcoders/global_components/custom_app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'components/product_management.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroSection(),
            TechnologyStack(),
            ProductManagementImage(),
          ],
        ),
      ),
    );
  }
}

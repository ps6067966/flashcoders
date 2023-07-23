import 'package:flutter/material.dart';

import '../../global_components/app_bar/x_mobile_app_bar.dart';
import '../../global_components/x_drawer.dart';

class IndexMobileScreen extends StatelessWidget {
  const IndexMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: XMobileAppBar(),
      endDrawer: XDrawer(),
      body: Column(
        children: [],
      ),
    );
  }
}

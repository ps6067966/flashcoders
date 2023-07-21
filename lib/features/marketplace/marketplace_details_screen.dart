import 'package:flashcoders/global_components/custom_app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MarketplaceDetailsScreen extends StatelessWidget {
  const MarketplaceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "🔥Coming Soon🔥",
              style: TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}

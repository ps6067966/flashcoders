import 'package:flashcoders/features/index/index_assets.dart';
import 'package:flashcoders/features/index/index_text.dart';
import 'package:flutter/material.dart';

import 'design_technology_explain_card.dart';

class ProductManagementImage extends StatelessWidget {
  const ProductManagementImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              IndexText.askWhy,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              IndexText.ifWhyIsClear,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 160.0,
            right: 160,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                flex: 2,
                child: DesignTechnologyExplainCard(
                  explainText: IndexText.designExplaination,
                ),
              ),
              Expanded(
                flex: 3,
                child: Image.asset(
                  IndexAssets.productManagement,
                  height: 500,
                ),
              ),
              const Expanded(
                flex: 2,
                child: DesignTechnologyExplainCard(
                  explainText: IndexText.technologyExplaination,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}

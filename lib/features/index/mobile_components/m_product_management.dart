import 'package:flashcoders/features/index/index_assets.dart';
import 'package:flashcoders/features/index/index_text.dart';
import 'package:flutter/material.dart';

import 'm_design_technology_explain_card.dart';

class MProductManagementImage extends StatelessWidget {
  const MProductManagementImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 40,
        ),
        const Text(
          IndexText.askWhy,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        const Text(
          IndexText.ifWhyIsClear,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MDesignTechnologyExplainCard(
                explainText: IndexText.designExplaination,
              ),
              Image.asset(
                IndexAssets.productManagement,
                height: 200,
              ),
              const MDesignTechnologyExplainCard(
                explainText: IndexText.technologyExplaination,
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

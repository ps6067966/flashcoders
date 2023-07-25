import 'package:flashcoders/features/marketplace/marketplace_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MarketplaceNavTextButton extends StatelessWidget {
  const MarketplaceNavTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushReplacementNamed(MarketPlacePath.marketplace);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Marketplace",
            style: TextStyle(
              fontSize: 17,
              color: GoRouterState.of(context)
                      .uri.toString()
                      .contains("flutter-institute")
                  ? Colors.white
                  : Colors.black,
            ),
          ),
          const SizedBox(
            width: 3,
          ),
          Container(
            height: 20,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade100,
            ),
            child: const Center(
              child: Text(
                "New",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

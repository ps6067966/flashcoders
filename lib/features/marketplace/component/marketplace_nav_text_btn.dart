import 'package:flashcoders/features/marketplace/marketplace_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MarketplaceNavTextButton extends StatelessWidget {
  const MarketplaceNavTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushReplacementNamed(marketplacePath);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Marketplace",
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          const SizedBox(
            width: 3,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade100,
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 6.0, right: 6, top: 4, bottom: 4),
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

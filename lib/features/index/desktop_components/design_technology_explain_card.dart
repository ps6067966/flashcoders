import 'package:flutter/material.dart';

class DesignTechnologyExplainCard extends StatelessWidget {
  final String explainText;
  const DesignTechnologyExplainCard({required this.explainText, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {},
      child: Card(
        elevation: 4,
        color: Colors.white,
        child: Container(
          height: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  explainText,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

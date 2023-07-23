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
        elevation: 5,
        color: const Color(0xfffff7dc),
        child: Container(
          height: 400,
          decoration: const BoxDecoration(
            color: Color(0xfffff7dc),
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

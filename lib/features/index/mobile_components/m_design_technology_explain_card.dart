import 'package:flutter/material.dart';

class MDesignTechnologyExplainCard extends StatelessWidget {
  final String explainText;
  const MDesignTechnologyExplainCard({required this.explainText, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {},
      child: Card(
        elevation: 3,
        color: Colors.white,
        child: Container(
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
                    fontSize: 16,
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

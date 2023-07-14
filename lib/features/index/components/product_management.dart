import 'package:flutter/material.dart';

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
              "Ask Why? Again and Again",
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
              "if why is clear, then how and what is easy. So always start with why...",
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
              Expanded(
                flex: 2,
                child: Card(
                  elevation: 5,
                  color: const Color(0xfffff7dc),
                  child: Container(
                    height: 400,
                    decoration: const BoxDecoration(
                      color: Color(0xfffff7dc),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "In today's world, design is more important than ever. \n\nIt's not just about making things look good. It's about creating products and services that are user-friendly, engaging, and effective.\n\nDesign can be used to improve customer experience, increase sales, and boost brand loyalty",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Image.asset("assets/logo/product_management.webp",
                    height: 500),
              ),
              Expanded(
                flex: 2,
                child: Card(
                  elevation: 5,
                  color: const Color(0xfffff7dc),
                  child: Container(
                    height: 400,
                    decoration: const BoxDecoration(
                      color: Color(0xfffff7dc),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Technology can help us to create more personalized experiences, collect data about our users, and deliver content in a more engaging way.\n\nBut it's important to use technology in the right way. We need to make sure that it's used to support our design goals, not to distract from them.",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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

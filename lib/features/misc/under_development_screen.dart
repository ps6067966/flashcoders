import 'package:flutter/material.dart';

class UnderDevelopmentScreen extends StatelessWidget {
  const UnderDevelopmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: XAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Website under development",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

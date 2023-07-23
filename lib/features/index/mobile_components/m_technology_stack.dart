import 'package:flashcoders/features/index/index_assets.dart';
import 'package:flashcoders/features/index/index_text.dart';
import 'package:flutter/material.dart';

class MTechnologyStack extends StatelessWidget {
  const MTechnologyStack({super.key});

  List<Widget> get _techStack => [
        const FlutterLogo(size: 50),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Image.asset(IndexAssets.firebaseLogo, height: 50),
        ),
        Image.asset(IndexAssets.serverpodLogo, height: 70),
        Image.asset(IndexAssets.qwikLogo, height: 50),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Image.asset(IndexAssets.postgreSQLLogo, height: 50),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
        ),
        const Text(
          IndexText.technologydStackHeading,
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _techStack
              .map((e) => Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: e,
                  ))
              .toList(),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

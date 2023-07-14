import 'package:flutter/material.dart';

class TechnologyStack extends StatelessWidget {
  const TechnologyStack({super.key});

  List<Widget> get _techStack => [
        const FlutterLogo(size: 100),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Image.asset("assets/logo/firebase.png", height: 100),
        ),
        Image.asset("assets/logo/serverpod.png", height: 120),
        Image.asset("assets/logo/Qwik.png", height: 100),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Image.asset("assets/logo/pgsql.png", height: 100),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 120.0, right: 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Technology Stack that makes development easier than ever before",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _techStack
                .map((e) => Padding(
                      padding: const EdgeInsets.only(right: 40.0),
                      child: e,
                    ))
                .toList(),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

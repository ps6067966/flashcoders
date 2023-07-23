import 'package:flashcoders/features/index/index_assets.dart';
import 'package:flashcoders/features/index/index_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TechnologyStack extends StatelessWidget {
  const TechnologyStack({super.key});

  List<Widget> get _techStack => [
        InkWell(
          onTap: () {
            launchUrl(Uri.parse("https://flutter.dev/"));
          },
          child: const FlutterLogo(size: 100),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: InkWell(
            onTap: () {
              launchUrl(Uri.parse("https://firebase.google.com/"));
            },
            child: Image.asset(IndexAssets.firebaseLogo, height: 100),
          ),
        ),
        InkWell(
          onTap: () {
            launchUrl(Uri.parse("https://serverpod.dev/"));
          },
          child: Image.asset(IndexAssets.serverpodLogo, height: 120),
        ),
        InkWell(
          onTap: () {
            launchUrl(Uri.parse("https://qwik.builder.io/"));
          },
          child: Image.asset(IndexAssets.qwikLogo, height: 100),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: InkWell(
            onTap: () {
              launchUrl(Uri.parse("https://www.postgresql.org/"));
            },
            child: Image.asset(IndexAssets.postgreSQLLogo, height: 100),
          ),
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
                IndexText.technologydStackHeading,
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w500,
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

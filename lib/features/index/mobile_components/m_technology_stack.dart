import 'package:flashcoders/features/index/index_assets.dart';
import 'package:flashcoders/features/index/index_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MTechnologyStack extends StatelessWidget {
  const MTechnologyStack({super.key});

  List<Widget> get _techStack => [
        InkWell(
          onTap: () {
            launchUrl(Uri.parse("https://flutter.dev/"));
          },
          child: const FlutterLogo(size: 40),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: InkWell(
            onTap: () {
              launchUrl(Uri.parse("https://firebase.google.com/"));
            },
            child: Image.asset(IndexAssets.firebaseLogo, height: 40),
          ),
        ),
        InkWell(
          onTap: () {
            launchUrl(Uri.parse("https://serverpod.dev/"));
          },
          child: Image.asset(IndexAssets.serverpodLogo, height: 60),
        ),
        InkWell(
          onTap: () {
            launchUrl(Uri.parse("https://qwik.builder.io/"));
          },
          child: Image.asset(IndexAssets.qwikLogo, height: 40),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: InkWell(
            onTap: () {
              launchUrl(Uri.parse("https://www.postgresql.org/"));
            },
            child: Image.asset(IndexAssets.postgreSQLLogo, height: 40),
          ),
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
            fontSize: 16,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _techStack
                .map((e) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: e,
                      ),
                    ))
                .toList(),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

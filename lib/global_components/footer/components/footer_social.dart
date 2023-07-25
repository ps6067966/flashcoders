import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../global/app_assets.dart';

class FooterSocial extends StatelessWidget {
  const FooterSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.flashCodersLogo,
          width: 80,
          height: 80,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Follow us on",
          style: TextStyle(
            fontSize: 20,
            color:
                GoRouterState.of(context).uri.toString().contains("flutter-institute")
                    ? Colors.white
                    : Colors.black,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: () {
                launchUrl(
                    Uri.parse("https://www.linkedin.com/company/flash-coders"));
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.3,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.network(
                    "https://img.icons8.com/color/144/linkedin.png",
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

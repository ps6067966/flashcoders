import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class XFloatingActionButton extends StatelessWidget {
  const XFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        launchUrl(Uri.parse("https://wa.me/+918058301863"));
      },
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Image.network("https://img.icons8.com/color/240/whatsapp--v1.png"),
      ),
    );
  }
}

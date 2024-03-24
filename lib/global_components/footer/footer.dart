import 'package:flashcoders/global_components/footer/components/footer_nav.dart';
import 'package:flashcoders/global_components/footer/components/footer_social.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Visibility(
      visible: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                child: FooterSocial(),
              ),
              Expanded(
                child: FooterNav(),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}

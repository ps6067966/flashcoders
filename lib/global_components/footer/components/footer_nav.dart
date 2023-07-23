import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../footer_notifier.dart';

class FooterNav extends StatelessWidget {
  const FooterNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final footerList = ref.watch(footerNotifierProvider).value;
      return ListView.builder(
        itemCount: footerList?.length ?? 0,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final footer = footerList?[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                if (footer?.name == "Contact") {}
                if (footer?.name == "FAQ") {}
                if (footer?.name == "Terms & Conditions") {}
                if (footer?.name == "Privacy Policy") {}
              },
              onHover: (value) {
                ref
                    .read(footerNotifierProvider.notifier)
                    .updateHoveringStatus(index, value);
              },
              child: Text(
                footer?.name ?? "",
                style: TextStyle(
                  fontSize: 20,
                  color: GoRouterState.of(context)
                          .location
                          .contains("flutter-institute")
                      ? Colors.white
                      : Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: footer?.isHovering ?? false
                      ? TextDecoration.underline
                      : TextDecoration.none,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      );
    });
  }
}

import 'package:flashcoders/global_components/footer/footer_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../global/app_assets.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Divider(),
        const SizedBox(
          height: 5,
        ),
        Wrap(
          runSpacing: 0,
          spacing: 0,
          verticalDirection: VerticalDirection.down,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.flashCodersLogo,
                  width: 80,
                  height: 80,
                ),
                size.width > 960
                    ? const SizedBox(
                        height: 10,
                      )
                    : const SizedBox(
                        height: 10,
                      ),
                const Text(
                  "Follow us on",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                size.width > 960
                    ? const SizedBox(
                        height: 10,
                      )
                    : const SizedBox(
                        height: 10,
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () {},
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
                size.width > 960
                    ? const SizedBox(
                        height: 20,
                      )
                    : const SizedBox(
                        height: 20,
                      ),
              ],
            ),
            SizedBox(
              width: size.width > 960 ? null : size.width,
              height: size.width > 960 ? null : null,
              child: Consumer(builder: (context, ref, child) {
                final footerList = ref.watch(footerNotifierProvider).value;
                return GridView.builder(
                  itemCount: footerList?.length ?? 0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: size.width > 960 ? 50 : 70,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 10,
                    crossAxisCount: size.width > 960 ? 4 : 4,
                  ),
                  itemBuilder: (context, index) {
                    final footer = footerList?[index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          if (footer?.name == "About") {}
                          if (footer?.name == "Mentors") {}
                          if (footer?.name == "Services") {}
                          if (footer?.name == "Resources") {}
                          if (footer?.name == "Contact") {}
                          if (footer?.name == "FAQ") {}
                          if (footer?.name == "Blog") {}
                          if (footer?.name == "Terms & Conditions") {}
                          if (footer?.name == "Privacy Policy") {}
                          if (footer?.name == "Refund & Return Policy") {}
                          if (footer?.name == "Sitemap") {}
                        },
                        onHover: (value) {
                          ref
                              .read(footerNotifierProvider.notifier)
                              .updateHoveringStatus(index, value);
                        },
                        child: Text(
                          footer?.name ?? "",
                          style: TextStyle(
                            fontSize: size.width > 960 ? 20 : 16,
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
              }),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Divider()
      ],
    );
  }
}

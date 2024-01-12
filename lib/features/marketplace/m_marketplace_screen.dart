import 'package:flashcoders/features/marketplace/marketplace_notifier.dart';
import 'package:flashcoders/global/ximage.dart';
import 'package:flashcoders/global_components/app_bar/x_mobile_app_bar.dart';
import 'package:flashcoders/global_components/floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../global_components/footer/footer.dart';
import 'marketplace_router.dart';

class MMarketplaceScreen extends StatelessWidget {
  const MMarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const XMobileAppBar(),
      floatingActionButton: const XFloatingActionButton(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      "Don't start from scratch!!!",
                      style: GoogleFonts.montserrat().copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    child: Text(
                      "Customize our apps to your needs to save time and money. Build with reusablility, decoupled code, feature-first approach, easy to use and customize.",
                      style: GoogleFonts.montserrat().copyWith(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Consumer(builder: (context, ref, child) {
                    final marketplaceData =
                        ref.watch(marketplaceNotifierProvider);
                    return GridView.builder(
                      itemCount: marketplaceData.value?.length ?? 0,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisExtent: 200,
                      ),
                      itemBuilder: (context, index) {
                        final data = marketplaceData.value![index];
                        return InkWell(
                          onTap: () {
                            context.pushNamed(
                                MarketPlacePath.marketplaceDetails,
                                pathParameters: {
                                  "id": data.id.toString(),
                                });
                          },
                          child: Card(
                            color: Colors.white,
                            surfaceTintColor: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                      child: XExtendedImage(
                                        url: data.imageUrl.toString(),
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.title ?? "",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "Price: " "₹${data.price ?? ""}",
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const Footer()
          ],
        ),
      ),
    );
  }
}

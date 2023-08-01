import 'package:flashcoders/features/marketplace/marketplace_notifier.dart';
import 'package:flashcoders/global/ximage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../global_components/app_bar/x_app_bar.dart';
import '../../global_components/footer/footer.dart';
import 'marketplace_router.dart';

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const XAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 160.0, right: 160.0, top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 800,
                    child: Text(
                      "Experience it before you buy it, Ready to use products that saves your time and money",
                      style: GoogleFonts.montserrat().copyWith(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: 800,
                    child: Text(
                      "Build with reusablility, decoupled code, feature-first approach, easy to use and customize.",
                      style: GoogleFonts.montserrat().copyWith(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
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
                        crossAxisCount: 3,
                        mainAxisExtent: 300,
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
                                  child: XExtendedImage(
                                    url: data.imageUrl.toString(),
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter,
                                    width: double.infinity,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
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
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
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
                    height: 60,
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

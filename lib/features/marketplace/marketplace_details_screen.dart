import 'package:flashcoders/features/marketplace/marketplace_details_notifier.dart';
import 'package:flashcoders/global_components/app_bar/x_app_bar.dart';
import 'package:flashcoders/global_components/footer/footer.dart';
import 'package:flashcoders/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:html_viewer_elite/html_viewer_elite.dart';
import 'package:url_launcher/url_launcher.dart';

class MarketplaceDetailsScreen extends StatelessWidget {
  final int id;
  const MarketplaceDetailsScreen({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const XAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          primary: true,
          clipBehavior: Clip.none,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 160.0, right: 160.0, top: 40),
                child: Consumer(builder: (context, ref, child) {
                  final refRead =
                      ref.read(marketplaceDetailsNotifierProvider.notifier);
                  return FutureBuilder(
                      future: refRead.getBlog(id),
                      builder: (context, snapshot) {
                        final blog = snapshot.data;
                        if (blog?.imageUrl == null) {
                          return const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          );
                        }
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    blog?.imageUrl ?? "",
                                    height: 400,
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Text(
                                    blog?.title ?? "",
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Html(
                                    data: blog?.description ?? "",
                                    onLinkTap:
                                        (url, context, attributes, element) {
                                      launchUrl(Uri.parse(url ?? ""));
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Card(
                                color: Colors.white,
                                surfaceTintColor: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        blog?.title ?? "",
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "Price: " "₹${blog?.price ?? ""}",
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        blog?.description ?? "",
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                      ),
                                      const SizedBox(
                                        height: 24,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(),
                                            onPressed: () {},
                                            child: const Text("Visit Website"),
                                          ),
                                          ElevatedButton.icon(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.primaryBlackColor,
                                              fixedSize: const Size(140, 40),
                                              foregroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                            ),
                                            icon:
                                                const Icon(Icons.shopping_cart),
                                            onPressed: () {},
                                            label: const Text("Buy Now"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                }),
              ),
              const SizedBox(
                height: 40,
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

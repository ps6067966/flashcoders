import 'package:flashcoders/features/marketplace/marketplace_details_notifier.dart';
import 'package:flashcoders/features/marketplace/marketplace_model.dart';
import 'package:flashcoders/global_components/app_bar/x_mobile_app_bar.dart';
import 'package:flashcoders/global_components/footer/footer.dart';
import 'package:flashcoders/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:html_viewer_elite/html_viewer_elite.dart';
import 'package:url_launcher/url_launcher.dart';

class MMarketplaceDetailsScreen extends StatefulWidget {
  final int id;
  const MMarketplaceDetailsScreen({required this.id, super.key});

  @override
  State<MMarketplaceDetailsScreen> createState() =>
      _MMarketplaceDetailsScreenState();
}

class _MMarketplaceDetailsScreenState extends State<MMarketplaceDetailsScreen> {
  MarketplaceModel? product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const XMobileAppBar(),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () {
                  launchUrl(Uri.parse("${product?.link}"));
                },
                child: Text(product?.productType == "app"
                    ? "Visit Play Store"
                    : "Visite Website"),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlackColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  launchUrl(Uri.parse("https://wa.me/+918058301863"));
                },
                label: const Text("Buy"),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          primary: true,
          clipBehavior: Clip.none,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 20),
                child: Consumer(builder: (context, ref, child) {
                  final refRead =
                      ref.read(marketplaceDetailsNotifierProvider.notifier);
                  return FutureBuilder(
                      future: refRead.getProduct(widget.id),
                      builder: (context, snapshot) {
                        product = snapshot.data;
                        if (product?.imageUrl == null) {
                          return const Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                              strokeWidth: 2,
                            ),
                          );
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              product?.imageUrl ?? "",
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              product?.title ?? "",
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Card(
                              color: Colors.white,
                              surfaceTintColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Html(
                                      data: product?.description ?? "",
                                      onLinkTap:
                                          (url, context, attributes, element) {
                                        launchUrl(Uri.parse(url ?? ""));
                                      },
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "Price: " "₹${product?.price ?? ""}",
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                  ],
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

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flashcoders/features/marketplace/marketplace_notifier.dart';
import 'package:flashcoders/global/ximage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../global_components/app_bar/custom_app_bar.dart';
import 'marketplace_router.dart';

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 160.0, right: 160.0, top: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer(builder: (context, ref, child) {
              final marketplaceData = ref.watch(marketplaceNotifierProvider);
              return GridView.builder(
                itemCount: marketplaceData.value?.length ?? 0,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 300,
                ),
                itemBuilder: (context, index) {
                  final data = marketplaceData.value![index];
                  return InkWell(
                    onTap: () {
                      context.pushNamed(MarketPlacePath.marketplaceDetails);
                    },
                    child: Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: FutureBuilder(
                                future: FirebaseStorage.instance
                                    .ref(data.imageUrl ?? "")
                                    .getDownloadURL(),
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) {
                                    return const Center(
                                        child: SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: CircularProgressIndicator(),
                                    ));
                                  }
                                  return XExtendedImage(
                                    url: snapshot.data.toString(),
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter,
                                    width: double.infinity,
                                  );
                                }),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
            })
          ],
        ),
      ),
    );
  }
}

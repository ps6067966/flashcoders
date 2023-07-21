import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../marketplace_add_product_notifier.dart';

class AddProductImage extends StatelessWidget {
  const AddProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final addProductModel =
          ref.watch(addProductInMarketplaceNotifierProvider).value;
      return InkWell(
        onTap: () {
          ref
              .read(addProductInMarketplaceNotifierProvider.notifier)
              .pickImage();
        },
        child: Card(
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              border: Border.all(),
              image: addProductModel != null && addProductModel.image != null
                  ? DecorationImage(
                      image: MemoryImage(addProductModel.image!),
                    )
                  : null,
              borderRadius: BorderRadius.circular(10),
            ),
            child: addProductModel != null && addProductModel.image != null
                ? null
                : const Center(
                    child: Icon(CupertinoIcons.camera),
                  ),
          ),
        ),
      );
    });
  }
}

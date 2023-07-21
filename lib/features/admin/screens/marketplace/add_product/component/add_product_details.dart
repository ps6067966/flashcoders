import 'dart:developer';

import 'package:flashcoders/features/admin/screens/marketplace/add_product/marketplace_add_product_notifier.dart';
import 'package:flashcoders/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/product_category_data.dart';

class AddProductDetails extends StatelessWidget {
  const AddProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: SingleChildScrollView(
        child: Consumer(builder: (context, ref, child) {
          final addProductModel =
              ref.watch(addProductInMarketplaceNotifierProvider);
          final refRead =
              ref.read(addProductInMarketplaceNotifierProvider.notifier);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Product Name",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter Product Name",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  refRead
                      .updateData(addProductModel.value!.copyWith(name: value));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Product Price",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter Product Price",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  refRead.updateData(
                      addProductModel.value!.copyWith(price: value));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Product Description",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              TextFormField(
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: "Enter Product Description",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Product Type",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                items: const ["App", "Game", "Website", "Software"]
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  refRead.updateData(
                      addProductModel.value!.copyWith(productType: value));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Product Category",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                items: productCategoryData
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  refRead.updateData(
                      addProductModel.value!.copyWith(productCategory: value));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlackColor,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: addProductModel.isLoading
                        ? null
                        : () {
                            refRead.submitData();
                          },
                    child: addProductModel.when(
                      data: (data) {
                        return const Text("Add Product");
                      },
                      error: (error, stackTrace) {
                        log(error.toString());
                        return const Text("Error");
                      },
                      loading: () {
                        return const SizedBox(
                          width: 15,
                          height: 15,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            strokeWidth: 2,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}

import 'package:flashcoders/features/admin/marketplace/add_product/component/add_product_details.dart';
import 'package:flashcoders/features/admin/marketplace/add_product/component/add_product_image.dart';
import 'package:flashcoders/global_components/app_bar/x_app_bar.dart';
import 'package:flashcoders/global_components/footer/footer.dart';
import 'package:flutter/material.dart';

class AddProductInMarketplaceScreen extends StatelessWidget {
  const AddProductInMarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: XAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 160.0,
            right: 160,
          ),
          child: Column(
            children: [
              Text(
                "Add Product In Marketplace",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AddProductImage(),
                  SizedBox(
                    width: 100,
                  ),
                  AddProductDetails(),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

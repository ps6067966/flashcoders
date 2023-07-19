import 'package:flashcoders/global_components/custom_app_bar/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProductInMarketplaceScreen extends StatelessWidget {
  const AddProductInMarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 160.0,
            right: 160,
          ),
          child: Column(
            children: [
              const Text(
                "Add Product In Marketplace",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      
                    },
                    child: Card(
                      child: Container(
                        width: 500,
                        height: 500,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Icon(CupertinoIcons.camera),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Column(
                    children: [],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

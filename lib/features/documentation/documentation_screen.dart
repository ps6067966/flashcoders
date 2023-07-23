import 'package:flashcoders/features/documentation/components/docs_heading.dart';
import 'package:flashcoders/features/documentation/components/docs_view.dart';
import 'package:flashcoders/global_components/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DocumentationScreen extends StatelessWidget {
  const DocumentationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: DocsHeading(),
              ),
              const VerticalDivider(),
              Expanded(
                flex: 4,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 130,
                  child: const SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DocsView(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

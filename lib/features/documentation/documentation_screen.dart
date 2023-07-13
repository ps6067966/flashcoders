import 'package:flashcoders/features/documentation/components/docs_heading.dart';
import 'package:flashcoders/features/documentation/components/docs_view.dart';
import 'package:flashcoders/global_components/custom_app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DocumentationScreen extends StatelessWidget {
  const DocumentationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DocsHeading(),
              ),
              VerticalDivider(),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DocsView(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flashcoders/features/documentation/components/docs_sub_heading.dart';
import 'package:flashcoders/features/documentation/data/docs_data.dart';
import 'package:flutter/material.dart';

class DocsHeading extends StatelessWidget {
  const DocsHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: DocsData.headingData.length,
      itemBuilder: (context, index) {
        final data = DocsData.headingData[index];
        return ExpansionTile(
          title: Text(
            data.title ?? "",
            style: const TextStyle(color: Colors.white),
          ),
          children:
              data.subHeadings?.map((e) => DocsSubHeading(e: e)).toList() ?? [],
        );
      },
    );
  }
}

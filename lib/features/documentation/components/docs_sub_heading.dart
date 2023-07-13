import 'package:flashcoders/features/documentation/model/docs_model.dart';
import 'package:flutter/material.dart';

class DocsSubHeading extends StatelessWidget {
  final DocsSubHeadingModel e;
  const DocsSubHeading({required this.e, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: ListTile(
        title: Text(
          e.title ?? "",
        ),
      ),
    );
  }
}

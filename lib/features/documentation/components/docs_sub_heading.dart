import 'package:flashcoders/features/documentation/docs_path_notifier.dart';
import 'package:flashcoders/features/documentation/model/docs_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DocsSubHeading extends ConsumerWidget {
  final DocsSubHeadingModel e;
  const DocsSubHeading({required this.e, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: ListTile(
        onTap: () {
          ref
              .read(docsPathProvider.notifier)
              .updateCurrentDocsPath(e.path ?? "");
        },
        title: Text(
          e.title ?? "",
        ),
      ),
    );
  }
}

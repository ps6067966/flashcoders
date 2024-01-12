import 'package:flashcoders/features/documentation/data/docs_data.dart';
import 'package:flashcoders/features/documentation/docs_path_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class DocsView extends StatelessWidget {
  const DocsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 40),
      child: SelectionArea(
        child: Consumer(builder: (context, ref, child) {
          final data = DocsData.docsViewData
              .where((e) => e.path == ref.watch(docsPathProvider).value)
              .toList()
              .first;
          return HtmlWidget(
            data.htmlView ?? "",
            textStyle: const TextStyle(color: Colors.white),
          );
        }),
      ),
    );
  }
}

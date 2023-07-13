import 'package:flutter_riverpod/flutter_riverpod.dart';

final docsPathProvider = AsyncNotifierProvider<DocsPathNotifier, String>(() {
  return DocsPathNotifier();
});

class DocsPathNotifier extends AsyncNotifier<String> {
  String currentDocsPath = "/getting-started/introduction";

  updateCurrentDocsPath(String path) {
    state = AsyncData(path);
  }

  @override
  String build() {
    return currentDocsPath;
  }
}

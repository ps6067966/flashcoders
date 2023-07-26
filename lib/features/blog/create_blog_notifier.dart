import 'package:flutter_riverpod/flutter_riverpod.dart';

final createBlogNotifierProvider =
    AsyncNotifierProvider<CreateBlogNotifier, void>(() {
  return CreateBlogNotifier();
});

class CreateBlogNotifier extends AsyncNotifier<void> {

  publishBlog() {
    state = const AsyncValue.loading();
  }

  @override
  void build() {}
}
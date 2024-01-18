import 'package:flashcoders/credentials.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'blog_model.dart';

final blogNotifierProvider =
    AsyncNotifierProvider<BlogNotifier, List<BlogModel>>(() {
  return BlogNotifier();
});

class BlogNotifier extends AsyncNotifier<List<BlogModel>> {
  List<BlogModel> blogModel = [];

  getBlogs() async {
    final data = await supabase.rest.from("blogs").select().order(
          "id",
          ascending: false,
        );
    blogModel = data.map((e) => BlogModel.fromMap(e)).toList();
    state = AsyncData(blogModel);
  }

  @override
  List<BlogModel> build() {
    getBlogs();
    return blogModel;
  }
}

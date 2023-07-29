import 'package:flashcoders/features/blog/blog_collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'blog_model.dart';

final blogNotifierProvider =
    AsyncNotifierProvider<BlogNotifier, List<BlogModel>>(() {
  return BlogNotifier();
});

class BlogNotifier extends AsyncNotifier<List<BlogModel>> {
  List<BlogModel> blogModel = [];
  
  getBlogs() async {
    final data = await blogCollection.orderBy("id", descending: true).get();
    blogModel = data.docs.map((e) => BlogModel.fromMap(e.data())).toList();
    state = AsyncData(blogModel);
  }

  @override
  List<BlogModel> build() {
    getBlogs();
    return blogModel;
  }
}

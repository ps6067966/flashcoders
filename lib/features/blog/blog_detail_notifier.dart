import 'package:flashcoders/features/blog/blog_collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'blog_model.dart';

final blogDetailsNotiferProvider =
    AsyncNotifierProvider<BlogDetailsNotifer, BlogModel?>(() {
  return BlogDetailsNotifer();
});

class BlogDetailsNotifer extends AsyncNotifier<BlogModel?> {
  BlogModel? blogModel;

  Future<BlogModel?> getBlog(int id) async {
    final data = await blogCollection.where("id", isEqualTo: id).limit(1).get();
    blogModel = BlogModel.fromMap(data.docs.first.data());
    state = AsyncData(blogModel);
    return blogModel;
  }

  @override
  BlogModel? build() {
    return blogModel;
  }
}

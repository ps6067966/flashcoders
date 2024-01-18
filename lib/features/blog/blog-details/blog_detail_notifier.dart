import 'package:flashcoders/credentials.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../blog_model.dart';

final blogDetailsNotiferProvider =
    AsyncNotifierProvider<BlogDetailsNotifer, BlogModel?>(() {
  return BlogDetailsNotifer();
});

class BlogDetailsNotifer extends AsyncNotifier<BlogModel?> {
  BlogModel? blogModel;

  Future<BlogModel?> getBlog(int id) async {
    final data = await supabase.rest.from("blogs").select().match({"id": id});
    blogModel = BlogModel.fromMap(data.first);
    state = AsyncData(blogModel);
    return blogModel;
  }

  @override
  BlogModel? build() {
    return blogModel;
  }
}

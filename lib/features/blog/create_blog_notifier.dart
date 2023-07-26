import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'blog_collection.dart';

final createBlogNotifierProvider =
    AsyncNotifierProvider<CreateBlogNotifier, BlogModel?>(() {
  return CreateBlogNotifier();
});

class CreateBlogNotifier extends AsyncNotifier<BlogModel?> {
  BlogModel? blogModel;

  clearImage() {
    blogModel = null;
    state = AsyncData(blogModel);
  }

  pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      blogModel = BlogModel(image: bytes, file: pickedFile);
      state = AsyncData(blogModel);
    }
  }

  publishBlog(BuildContext context, String post) async {
    if (blogModel == null || blogModel!.file == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please select a image")));
      return;
    }
    state = const AsyncValue.loading();
    await sendFileImage();
    await blogCollection.add({
      'id': 1,
      'image': blogModel?.imageUrl,
      "post": post,
      'createdAt': DateTime.now().millisecondsSinceEpoch,
    });
    blogModel = null;
    state = AsyncData(blogModel);
  }

  Future<void> sendFileImage() async {
    final ref = FirebaseStorage.instance.ref().child('blog');
    await ref.putData(
        blogModel!.image!, SettableMetadata(contentType: 'image/png'));
    final url = await ref.getDownloadURL();
    blogModel?.imageUrl = url;
  }

  @override
  BlogModel? build() {
    return blogModel;
  }
}

class BlogModel {
  final XFile? file;
  final Uint8List? image;
  String? imageUrl;
  BlogModel({required this.file, required this.image, this.imageUrl});
}

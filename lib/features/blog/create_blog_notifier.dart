import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../global/collections.dart';
import '../../global/model/user_model.dart';
import 'blog_collection.dart';

final createBlogNotifierProvider =
    AsyncNotifierProvider<CreateBlogNotifier, CreateBlogModel?>(() {
  return CreateBlogNotifier();
});

class CreateBlogNotifier extends AsyncNotifier<CreateBlogModel?> {
  CreateBlogModel? blogModel;

  clearImage() {
    blogModel = null;
    state = AsyncData(blogModel);
  }

  pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      blogModel = CreateBlogModel(image: bytes, file: pickedFile);
      state = AsyncData(blogModel);
    }
  }

  publishBlog(
      {required BuildContext context,
      required String post,
      required title}) async {
    if (blogModel == null || blogModel!.file == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please select a image")));
      return;
    }
    state = const AsyncValue.loading();

    final blogData =
        await blogCollection.orderBy("id", descending: true).limit(1).get();
    final blog = blogData.docs.first.data();

    await sendFileImage(blog['id'] + 1);

    final userData = await userCollection
        .where("email", isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .limit(1)
        .get();

    final user = UserModel.fromMap(userData.docs.first.data());

    if (user.userId == null) {
      return;
    }
    await blogCollection.add({
      'id': blog['id'] + 1,
      'image': blogModel?.imageUrl,
      'title': title,
      "user_id": user.userId,
      "name": user.name,
      "photo_url": user.photoUrl,
      "email": user.email,
      "post": post,
      'created_at': FieldValue.serverTimestamp(),
    });
    blogModel = null;
    state = AsyncData(blogModel);
  }

  Future<void> sendFileImage(int id) async {
    final ref = FirebaseStorage.instance.ref().child('blog').child("$id");
    await ref.putData(
        blogModel!.image!, SettableMetadata(contentType: 'image/png'));
    final url = await ref.getDownloadURL();
    blogModel?.imageUrl = url;
  }

  @override
  CreateBlogModel? build() {
    return blogModel;
  }
}

class CreateBlogModel {
  final XFile? file;
  final Uint8List? image;
  String? imageUrl;
  CreateBlogModel({required this.file, required this.image, this.imageUrl});
}

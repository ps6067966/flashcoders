import 'dart:developer';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcoders/features/blog/create_blog_notifier.dart';
import 'package:flashcoders/global_components/app_bar/x_app_bar.dart';
import 'package:flashcoders/global_components/floating_action_button.dart';
import 'package:flashcoders/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateBlogPostScreen extends StatelessWidget {
  CreateBlogPostScreen({super.key});

  final String name = FirebaseAuth.instance.currentUser?.displayName ?? "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const XAppBar(),
      floatingActionButton: const XFloatingActionButton(),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 160.0,
          right: 160,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Card(
                    color: Colors.white,
                    surfaceTintColor: Colors.white,
                    elevation: 5,
                    child: SizedBox(
                      height: 350,
                      child: SizedBox(),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                SizedBox(
                  width: 350,
                  child: Consumer(builder: (context, ref, child) {
                    final refRead =
                        ref.read(createBlogNotifierProvider.notifier);
                    final blogModel = ref.watch(createBlogNotifierProvider);
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: blogModel.isLoading
                              ? null
                              : () {
                                  refRead.pickImage();
                                },
                          child: const Text("Add a cover image"),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        blogModel.value != null &&
                                blogModel.value?.image != null
                            ? InkWell(
                                onTap: () {
                                  refRead.clearImage();
                                },
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      height: 200,
                                      child:
                                          Image.memory(blogModel.value!.image!),
                                    ),
                                    const Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Icon(Icons.close),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : const SizedBox()
                      ],
                    );
                  }),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Consumer(builder: (context, ref, child) {
                  final refRead = ref.read(createBlogNotifierProvider.notifier);
                  final blogModel = ref.watch(createBlogNotifierProvider);
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlackColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    onPressed: blogModel.isLoading
                        ? null
                        : () async {
                            try {
                              await refRead.publishBlog(context, "");
                            } catch (e) {
                              log("$e");
                            }
                          },
                    child: blogModel.isLoading
                        ? const SizedBox(
                            width: 15,
                            height: 15,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            "Publish",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                  );
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcoders/features/blog/blog_router.dart';
import 'package:flashcoders/global_components/app_bar/x_app_bar.dart';
import 'package:flashcoders/global_components/footer/footer.dart';
import 'package:flashcoders/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../global_components/floating_action_button.dart';
import '../auth/auth_router.dart';
import 'blog_notifier.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const XAppBar(),
      floatingActionButton: const XFloatingActionButton(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 160.0,
                right: 160.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        onPressed: () {
                          if (FirebaseAuth.instance.currentUser == null) {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  title: const Text("Sign in to create a post"),
                                  actions: [
                                    CupertinoDialogAction(
                                      child: const Text("Close"),
                                      onPressed: () {
                                        context.pop();
                                      },
                                    ),
                                    CupertinoDialogAction(
                                      child: const Text("Sign in"),
                                      onPressed: () {
                                        context.pushReplacement(AuthPath.auth);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                            return;
                          }
                          context.pushReplacementNamed(BlogPath.createBlogPost);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Create Post",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer(builder: (context, ref, child) {
                    final blogModel = ref.watch(blogNotifierProvider);
                    return GridView.builder(
                      itemCount: blogModel.value?.length ?? 0,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final blog = blogModel.value?[index];
                        return InkWell(
                          onTap: () {
                            context.pushNamed(
                              BlogPath.blogDetails,
                              pathParameters: {"id": blog?.id.toString() ?? ""},
                            );
                          },
                          child: Card(
                            elevation: 5,
                            color: Colors.white,
                            surfaceTintColor: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.network(
                                  blog?.image ?? "",
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    blog?.title ?? "",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircleAvatar(
                                        radius: 12,
                                        backgroundImage: NetworkImage(
                                          blog?.photoUrl ?? "",
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        blog?.name ?? "",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

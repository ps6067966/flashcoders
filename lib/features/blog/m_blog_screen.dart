import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcoders/global_components/app_bar/x_mobile_app_bar.dart';
import 'package:flashcoders/global_components/footer/footer.dart';
import 'package:flashcoders/global_components/x_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../theme/app_colors.dart';
import '../auth/auth_router.dart';
import 'blog_notifier.dart';
import 'blog_router.dart';

class MBlogScreen extends StatelessWidget {
  const MBlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const XDrawer(),
      appBar: const XMobileAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
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
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer(builder: (context, ref, child) {
              final blogModel = ref.watch(blogNotifierProvider);
              return ListView.builder(
                itemCount: blogModel.value?.length ?? 0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final blog = blogModel.value?[index];
                  return InkWell(
                    onTap: () {
                      context.pushNamed(
                        BlogPath.blogDetails,
                        pathParameters: {"id": blog?.id.toString() ?? ""},
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
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
                                  Expanded(
                                    child: Text(
                                      blog?.name ?? "",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
            const SizedBox(
              height: 40,
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

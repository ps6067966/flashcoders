import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcoders/features/blog/blog_router.dart';
import 'package:flashcoders/global_components/app_bar/x_app_bar.dart';
import 'package:flashcoders/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../global_components/floating_action_button.dart';
import '../auth/auth_router.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const XAppBar(),
      floatingActionButton: const XFloatingActionButton(),
      body: Padding(
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
            const Spacer(),
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "🔥Comming Very Soon🔥",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

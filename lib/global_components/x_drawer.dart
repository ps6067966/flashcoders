import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcoders/features/auth/auth_router.dart';
import 'package:flashcoders/features/index/index_router.dart';
import 'package:flashcoders/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/blog/desktop_component/blog_nav_text_btn.dart';
import '../features/flutter-institute/desktop_components/flutter_institute_nav_text_btn.dart';

class XDrawer extends StatelessWidget {
  const XDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:
          GoRouterState.of(context).uri.toString().contains("flutter-institute")
              ? AppColors.primaryBlackColor
              : Colors.black,
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const FlutterInstituteNavTextButton(),
            const SizedBox(
              height: 16,
            ),
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 34,
                ),
                BlogNavTextButton(),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            FirebaseAuth.instance.currentUser != null
                ? Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryBlackColor,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          context.pushReplacement(indexPath);
                        },
                        child: const Text("Sign out")),
                  )
                : Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlackColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        context.pushReplacementNamed(AuthPath.auth);
                      },
                      child: const Text("Sign in"),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

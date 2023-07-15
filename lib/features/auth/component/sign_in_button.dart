import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcoders/features/auth/auth_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../theme/app_colors.dart';

class SignInButton extends StatelessWidget {
  SignInButton({super.key});

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (auth.currentUser != null) {
      return PopupMenuButton(
        position: PopupMenuPosition.under,
        offset: const Offset(0, 30),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              child: TextButton(
                onPressed: () {
                  auth.signOut();
                  context.pushReplacement(AuthPath.auth);
                },
                child: const Text("Sign out"),
              ),
            ),
          ];
        },
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(auth.currentUser!.photoURL!),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle),
        ),
      );
    }
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryBlackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        context.pushReplacement(AuthPath.auth);
      },
      child: const Text(
        "Sign in",
        style: TextStyle(
          fontSize: 17,
          letterSpacing: 1,
        ),
      ),
    );
  }
}

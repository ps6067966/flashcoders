import 'package:flashcoders/features/auth/auth_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../theme/app_colors.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryBlackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        context.pushReplacement(authPath);
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

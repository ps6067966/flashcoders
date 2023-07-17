import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcoders/features/admin/admin_panel_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminPanelNavTextButton extends StatelessWidget {
  const AdminPanelNavTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  context.pushReplacementNamed(AdminPanelPath.adminPanel);
                },
                child: const Text(
                  "Admin",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(
                width: 24,
              ),
            ],
          )
        : const SizedBox();
  }
}

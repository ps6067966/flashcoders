import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcoders/features/admin/admin_panel_router.dart';
import 'package:flashcoders/global/collections.dart';
import 'package:flashcoders/global/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminPanelNavTextButton extends StatelessWidget {
  const AdminPanelNavTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser != null
        ? FutureBuilder(
            future: currentUserSnapshot,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const SizedBox();
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox();
              }
              if (snapshot.data == null || snapshot.data?.data() == null) {
                return const SizedBox();
              }
              final currentUser = UserModel.fromMap(snapshot.data!.data()!);
              if (!(currentUser.isAdmin ?? false)) {
                return const SizedBox();
              }
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      context.pushReplacementNamed(AdminPanelPath.adminPanel);
                    },
                    child: Text(
                      "Admin",
                      style: TextStyle(
                        fontSize: 17,
                        color: GoRouterState.of(context)
                                .uri
                                .toString()
                                .contains("flutter-institute")
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                ],
              );
            })
        : const SizedBox();
  }
}

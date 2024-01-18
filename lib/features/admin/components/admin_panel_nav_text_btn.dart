import 'package:flashcoders/credentials.dart';
import 'package:flashcoders/features/admin/admin_panel_router.dart';
import 'package:flashcoders/features/admin/components/admin_api.dart';
import 'package:flashcoders/global/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminPanelNavTextButton extends StatelessWidget {
  const AdminPanelNavTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return supabase.auth.currentUser != null
        ? FutureBuilder<UserModel?>(
            future: AdminApi.getCurrentUserData(),
            builder: (context, snapshot) {
              if (!(snapshot.data?.isAdmin ?? false)) {
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
                            : Colors.white,
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

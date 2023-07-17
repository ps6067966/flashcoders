import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../theme/app_colors.dart';
import '../admin_notifier.dart';

class AdminGridView extends StatelessWidget {
  const AdminGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50,
        left: 160.0,
        right: 160,
      ),
      child: Consumer(builder: (context, ref, child) {
        final adminList = ref.watch(adminNotifierProvider).value;
        return GridView.builder(
          itemCount: adminList?.length ?? 0,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisExtent: 150,
            crossAxisSpacing: 50,
            mainAxisSpacing: 50,
          ),
          itemBuilder: (context, index) {
            final adminModel = adminList?[index];
            return InkWell(
              onTap: () {
                context.push(adminModel?.route ?? "");
              },
              child: Card(
                color: AppColors.primaryBlackColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        adminModel?.title ?? "",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        adminModel?.description ?? "",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "View Details",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

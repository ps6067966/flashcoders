import 'package:flashcoders/features/auth/role_model_notifier.dart';
import 'package:flashcoders/global/enum/roles.dart';
import 'package:flashcoders/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectRole extends StatelessWidget {
  const SelectRole({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Select your role",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 700,
          child: Consumer(builder: (context, ref, child) {
            final roles = ref.watch(roleSelectorNotifierProvider).value;
            return GridView.builder(
              shrinkWrap: true,
              itemCount: roles?.length ?? 0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 30,
                crossAxisSpacing: 20,
                mainAxisExtent: 120,
              ),
              itemBuilder: (context, index) {
                final role = roles?[index];
                return InkWell(
                  onTap: () {
                    ref
                        .read(roleSelectorNotifierProvider.notifier)
                        .updateRole(index);
                  },
                  child: Card(
                    color: role?.isSelected ?? false
                        ? AppColors.primaryBlackColor
                        : Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                          role?.iconUrl ?? "",
                          width: role?.name.getName == "Collaborator" ? 50 : 60,
                          height:
                              role?.name.getName == "Collaborator" ? 50 : 60,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          role?.name.getName ?? "",
                          style: TextStyle(
                            fontSize: 18,
                            color: role?.isSelected ?? false
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}

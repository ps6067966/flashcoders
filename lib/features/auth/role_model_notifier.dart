import 'package:flashcoders/global/enum/roles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final roleSelectorNotifierProvider =
    AsyncNotifierProvider<RoleNotifier, List<RoleModel>>(() {
  return RoleNotifier();
});

class RoleNotifier extends AsyncNotifier<List<RoleModel>> {
  List<RoleModel> role = [
    RoleModel(
      name: Roles.collaborator,
      iconUrl: "https://img.icons8.com/color/96/collaborator-male--v1.png",
      isSelected: true,
    ),
    RoleModel(
      name: Roles.client,
      iconUrl: "https://img.icons8.com/bubbles/200/user-male.png",
    ),
    RoleModel(
      name: Roles.blogger,
      iconUrl: "https://img.icons8.com/bubbles/100/man-laptop-pencil.png",
    ),
    RoleModel(
      name: Roles.teamMember,
      iconUrl: "https://img.icons8.com/bubbles/100/user-group-man-woman.png",
    ),
  ];

  updateRole(int index) {
    if (role[index].isSelected) {
      final data = role.where((element) => element.isSelected);
      if (data.length == 1) {
        return;
      }
    }
    role[index].isSelected = !role[index].isSelected;
    state = AsyncData(role);
  }

  @override
  List<RoleModel> build() {
    return role;
  }
}

class RoleModel {
  final Roles name;
  final String iconUrl;
  bool isSelected;

  RoleModel({
    required this.name,
    required this.iconUrl,
    this.isSelected = false,
  });
}

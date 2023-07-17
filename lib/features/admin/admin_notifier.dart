import 'package:flutter_riverpod/flutter_riverpod.dart';

final adminNotifierProvider =
    AsyncNotifierProvider<AdminNotifier, List<AdminModel>>(() {
  return AdminNotifier();
});

class AdminNotifier extends AsyncNotifier<List<AdminModel>> {
  List<AdminModel> adminList = [
    AdminModel(
      title: "Add product in marketplace",
      description:
          "Marketplace in place where user can buy and sell app and websites made with flutter.",
      route: "/admin/marketplace/add-product",
    ),
  ];

  @override
  List<AdminModel> build() {
    return adminList;
  }
}

class AdminModel {
  final String title;
  final String description;
  final String route;

  AdminModel({
    required this.title,
    required this.description,
    required this.route,
  });
}

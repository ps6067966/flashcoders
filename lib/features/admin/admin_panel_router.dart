import 'package:flashcoders/features/admin/admin_panel_screen.dart';
import 'package:flashcoders/features/admin/marketplace/add_product/marketplace_add_product_screen.dart';
import 'package:go_router/go_router.dart';

class AdminPanelPath {
  static const String adminPanel = "/admin";
  static const String addProductInMarketplace =
      "/admin/marketplace/add-product";
}

final List<RouteBase> adminPanelRouter = [
  GoRoute(
    path: AdminPanelPath.adminPanel,
    name: AdminPanelPath.adminPanel,
    builder: (context, state) {
      return const AdminPanelScreen();
    },
  ),
  GoRoute(
    path: AdminPanelPath.addProductInMarketplace,
    name: AdminPanelPath.addProductInMarketplace,
    builder: (context, state) {
      return const AddProductInMarketplaceScreen();
    },
  ),
];

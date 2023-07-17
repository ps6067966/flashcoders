import 'package:flashcoders/features/admin/admin_panel_screen.dart';
import 'package:go_router/go_router.dart';

class AdminPanelPath {
  static const String adminPanel = "/admin";
}

final List<RouteBase> adminPanelRouter = [
  GoRoute(
    path: AdminPanelPath.adminPanel,
    name: AdminPanelPath.adminPanel,
    builder: (context, state) {
      return const AdminPanelScreen();
    },
  ),
];

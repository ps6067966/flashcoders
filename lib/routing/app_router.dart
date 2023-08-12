import 'package:flashcoders/features/admin/admin_panel_router.dart';
import 'package:flashcoders/features/blog/blog_router.dart';
import 'package:flashcoders/features/documentation/documentation_router.dart';
import 'package:flashcoders/features/flutter-institute/flutter_institute_router.dart';
import 'package:flashcoders/features/marketplace/marketplace_router.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/auth_router.dart';
import '../features/delete_account/delete_account_router.dart';
import '../features/index/index_router.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    ...authRouter,
    ...adminPanelRouter,
    ...indexRouter,
    ...marketplaceRouter,
    ...flutterInstituteRouter,
    ...docRouter,
    ...blogRouter,
    ...deleteAccountRouter,
  ],
);

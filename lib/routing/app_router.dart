import 'package:flashcoders/features/blog/blog_router.dart';
import 'package:flashcoders/features/documentation/documentation_router.dart';
import 'package:flashcoders/features/marketplace/marketplace_router.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/auth_router.dart';
import '../features/index/index_router.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    ...authRouter,
    ...indexRouter,
    ...marketplaceRouter,
    ...docRouter,
    ...blogRouter,
  ],
);

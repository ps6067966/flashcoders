import 'package:flashcoders/features/blog/blog_router.dart';
import 'package:flashcoders/features/documentation/documentation_router.dart';
import 'package:go_router/go_router.dart';

import '../features/index/index_router.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    ...indexRouter,
    ...docRouter,
    ...blogRouter,
  ],
);

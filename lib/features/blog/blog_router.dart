import 'package:flashcoders/features/blog/blog_screen.dart';
import 'package:go_router/go_router.dart';

const blogPath = "/blogs";

final List<RouteBase> blogRouter = [
  GoRoute(
    path: blogPath,
    name: blogPath,
    builder: (context, state) {
      return const BlogScreen();
    },
  ),
];

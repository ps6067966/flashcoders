import 'package:flashcoders/features/blog/blog_screen.dart';
import 'package:flashcoders/features/blog/create_blog_post_screen.dart';
import 'package:go_router/go_router.dart';

class BlogPath {
  static const blog = "/blogs";
  static const createBlogPost = "/create-post";
}

final List<RouteBase> blogRouter = [
  GoRoute(
    path: BlogPath.blog,
    name: BlogPath.blog,
    builder: (context, state) {
      return const BlogScreen();
    },
  ),
  GoRoute(
    path: BlogPath.createBlogPost,
    name: BlogPath.createBlogPost,
    builder: (context, state) {
      return CreateBlogPostScreen();
    },
  ),
];

import 'package:flashcoders/features/blog/blog_details_screen.dart';
import 'package:flashcoders/features/blog/blog_screen.dart';
import 'package:flashcoders/features/blog/create_blog_screen.dart';
import 'package:go_router/go_router.dart';

class BlogPath {
  static const blog = "/blogs";
  static const createBlogPost = "/create-post";
  static const blogDetails = "/blogs/:id";
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
      return const CreateBlogScreen();
    },
  ),
  GoRoute(
    path: BlogPath.blogDetails,
    name: BlogPath.blogDetails,
    builder: (context, state) {
      final id = int.tryParse(state.pathParameters["id"] ?? "0") ?? 0;
      return BlogDetailsScreen(
        id: id,
      );
    },
  ),
];

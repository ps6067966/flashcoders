import 'package:go_router/go_router.dart';

import 'index_screen.dart';

const indexPath = "/";

final List<RouteBase> indexRouter = [
  GoRoute(
    path: indexPath,
    name: indexPath,
    builder: (context, state) {
      return const IndexScreen();
    },
  ),
];

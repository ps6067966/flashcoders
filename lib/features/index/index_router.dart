import 'package:go_router/go_router.dart';

import 'index_screen.dart';

const indexPath = "/";

final indexRouter = [
  GoRoute(
    path: indexPath,
    builder: (context, state) {
      return const IndexScreen();
    },
  ),
];

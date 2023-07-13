import 'package:flashcoders/features/documentation/documentation_screen.dart';
import 'package:go_router/go_router.dart';

const docPath = "/docs";

final List<RouteBase> docRouter = [
  GoRoute(
    path: docPath,
    name: docPath,
    builder: (context, state) {
      return const DocumentationScreen();
    },
  ),
];

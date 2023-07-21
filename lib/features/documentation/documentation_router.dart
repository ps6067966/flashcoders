import 'package:flashcoders/features/documentation/documentation_screen.dart';
import 'package:go_router/go_router.dart';

class DocumentationPath {
  static const String docs = "/docs";
}

final List<RouteBase> docRouter = [
  GoRoute(
    path: DocumentationPath.docs,
    name: DocumentationPath.docs,
    builder: (context, state) {
      return const DocumentationScreen();
    },
  ),
];

import 'package:go_router/go_router.dart';

import 'flutter_institute.dart';

class FlutterInstitutePath {
  static const String flutterInstitute = "/flutter-institute";
}

final List<RouteBase> flutterInstituteRouter = [
  GoRoute(
    path: FlutterInstitutePath.flutterInstitute,
    name: FlutterInstitutePath.flutterInstitute,
    builder: (context, state) {
      return const FlutterInstituteScreen();
    },
  ),
];

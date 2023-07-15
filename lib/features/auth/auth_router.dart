import 'package:flashcoders/features/auth/auth_screen.dart';
import 'package:go_router/go_router.dart';

class AuthPath {
  static const String auth = "/auth";
}

final List<RouteBase> authRouter = [
  GoRoute(
    path: AuthPath.auth,
    name: AuthPath.auth,
    builder: (context, state) {
      return const AuthScreen();
    },
  ),
];

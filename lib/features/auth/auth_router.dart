import 'package:flashcoders/features/auth/auth_screen.dart';
import 'package:go_router/go_router.dart';

const authPath = "/auth";

final List<RouteBase> authRouter = [
  GoRoute(
    path: authPath,
    name: authPath,
    builder: (context, state) {
      return const AuthScreen();
    },
  ),
];

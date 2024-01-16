import 'package:flashcoders/features/privacy-policy/heart_line_privacy_screen.dart';
import 'package:flashcoders/features/privacy-policy/privacy_route_names.dart';
import 'package:flashcoders/features/privacy-policy/whizz_brain_privacy_screen.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> privacyRouter = [
  GoRoute(
    path: PrivacyRouteNames.whizzBrainPrivacy,
    builder: (context, state) {
      return const WhizzBrainPrivacyScreen();
    },
  ),
  GoRoute(
    path: PrivacyRouteNames.heartLinePrivacy,
    builder: (context, state) {
      return const HeartLinePrivacyScreen();
    },
  ),
];

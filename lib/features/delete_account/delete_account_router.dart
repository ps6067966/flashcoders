import 'package:flashcoders/features/delete_account/the_one_and_only.dart';
import 'package:go_router/go_router.dart';

class DeleteAccountPath {
  static const String theOneAndOnly = "/the-one-and-only";
}

final List<RouteBase> deleteAccountRouter = [
  GoRoute(
    path: DeleteAccountPath.theOneAndOnly,
    name: DeleteAccountPath.theOneAndOnly,
    builder: (context, state) {
      return const TheOneAndOnlyDeleteAccountRequestScreen();
    },
  ),
];

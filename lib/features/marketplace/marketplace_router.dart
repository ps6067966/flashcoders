import 'package:flashcoders/features/marketplace/marketplace_screen.dart';
import 'package:go_router/go_router.dart';

const marketplacePath = "/marketplace";

final List<RouteBase> marketplaceRouter = [
  GoRoute(
    path: marketplacePath,
    name: marketplacePath,
    builder: (context, state) {
      return const MarketplaceScreen();
    },
  ),
];

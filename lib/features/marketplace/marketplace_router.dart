import 'package:flashcoders/features/marketplace/marketplace_details_screen.dart';
import 'package:flashcoders/features/marketplace/marketplace_screen.dart';
import 'package:go_router/go_router.dart';

class MarketPlacePath {
  static const String marketplace = "/marketplace";
  static const String marketplaceDetails = "/marketplace/:id";
}

final List<RouteBase> marketplaceRouter = [
  GoRoute(
    path: MarketPlacePath.marketplace,
    name: MarketPlacePath.marketplace,
    builder: (context, state) {
      return const MarketplaceScreen();
    },
  ),
  GoRoute(
    path: MarketPlacePath.marketplaceDetails,
    name: MarketPlacePath.marketplaceDetails,
    builder: (context, state) {
      final id = int.tryParse(state.pathParameters["id"] ?? "0") ?? 0;
      return MarketplaceDetailsScreen(
        id: id,
      );
    },
  ),
];

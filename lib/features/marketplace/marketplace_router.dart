import 'package:flashcoders/features/marketplace/marketplace_details_screen.dart';
import 'package:flashcoders/features/marketplace/marketplace_screen.dart';
import 'package:go_router/go_router.dart';

class MarketPlacePath {
  static const String marketplace = "/marketplace";
  static const String marketplaceDetails = "/marketplace-details";
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
      return const MarketplaceDetailsScreen();
    },
  ),
];

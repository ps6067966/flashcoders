import 'package:flashcoders/features/portfolio/portfolio_screen.dart';
import 'package:go_router/go_router.dart';

const portfolioPath = "/portfolio/pratap-singh-shekhawat";

final List<RouteBase> portfolioRouter = [
  GoRoute(
    path: portfolioPath,
    name: portfolioPath,
    builder: (context, state) {
      return const PortfolioScreen();
    },
  ),
];

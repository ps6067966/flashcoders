import 'package:flutter_riverpod/flutter_riverpod.dart';

final portfolioNotifierProvider =
    AsyncNotifierProvider<PortfolioNotifier, String>(() {
  return PortfolioNotifier();
});

class PortfolioNotifier extends AsyncNotifier<String> {
  String selectedMenu = "About";

  changeSelectedMenu(String value) {
    state = AsyncData(value);
  }

  @override
  String build() {
    return selectedMenu;
  }
}

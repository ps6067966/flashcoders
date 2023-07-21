import 'package:flashcoders/features/marketplace/marketplace_collection.dart';
import 'package:flashcoders/features/marketplace/marketplace_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final marketplaceNotifierProvider =
    AsyncNotifierProvider<MarketplaceNotifer, List<MarketplaceModel>>(() {
  return MarketplaceNotifer();
});

class MarketplaceNotifer extends AsyncNotifier<List<MarketplaceModel>> {
  List<MarketplaceModel> marketplaceModel = [];

  getMarketplaceData() async {
    state = const AsyncValue.loading();
    final snapshot =
        await marketplaceCollection.orderBy("id", descending: true).get();
    final marketplaceData =
        snapshot.docs.map((e) => MarketplaceModel.fromMap(e.data())).toList();
    state = AsyncData(marketplaceData);
  }

  @override
  List<MarketplaceModel> build() {
    getMarketplaceData();
    return marketplaceModel;
  }
}

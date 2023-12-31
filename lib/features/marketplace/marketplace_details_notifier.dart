import 'package:flashcoders/features/marketplace/marketplace_collection.dart';
import 'package:flashcoders/features/marketplace/marketplace_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final marketplaceDetailsNotifierProvider =
    AsyncNotifierProvider<MarketplaceDetailsNotifier, MarketplaceModel?>(() {
  return MarketplaceDetailsNotifier();
});

class MarketplaceDetailsNotifier extends AsyncNotifier<MarketplaceModel?> {
  MarketplaceModel? marketplaceModel;

  Future<MarketplaceModel?> getProduct(int id) async {
    final data =
        await marketplaceCollection.where("id", isEqualTo: id).limit(1).get();
    marketplaceModel = MarketplaceModel.fromMap(data.docs.first.data());
    state = AsyncData(marketplaceModel);
    return marketplaceModel;
  }

  @override
  MarketplaceModel? build() {
    return marketplaceModel;
  }
}

import 'package:flashcoders/credentials.dart';
import 'package:flashcoders/features/marketplace/marketplace_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final marketplaceDetailsNotifierProvider =
    AsyncNotifierProvider<MarketplaceDetailsNotifier, MarketplaceModel?>(() {
  return MarketplaceDetailsNotifier();
});

class MarketplaceDetailsNotifier extends AsyncNotifier<MarketplaceModel?> {
  MarketplaceModel? marketplaceModel;

  Future<MarketplaceModel?> getProduct(int id) async {
    final data = await supabase.rest
        .from("marketplace")
        .select()
        .match({"id": id}).limit(1);

    marketplaceModel = MarketplaceModel.fromMap(data.first);
    state = AsyncData(marketplaceModel);
    return marketplaceModel;
  }

  @override
  MarketplaceModel? build() {
    return marketplaceModel;
  }
}

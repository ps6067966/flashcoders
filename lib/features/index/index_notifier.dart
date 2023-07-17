import 'package:flutter_riverpod/flutter_riverpod.dart';

final indexNotifierProvider = AsyncNotifierProvider<IndexNotifier, void>(() {
  return IndexNotifier();
});

class IndexNotifier extends AsyncNotifier<void> {

  getCurrentUserData() {
    

  }

  @override
  void build() {
    getCurrentUserData();
  }
}

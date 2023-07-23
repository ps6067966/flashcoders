import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final couponAppliedNotifierProvider = AsyncNotifierProvider<CouponAppliedNotifier, bool>(() {
  return CouponAppliedNotifier();
});

class CouponAppliedNotifier extends AsyncNotifier<bool> {
  bool isCouponApplied = false;

  checkIfCouponIsCorrect(String value) async {
    final snapshot =
        await FirebaseFirestore.instance.collection("coupon").doc("1").get();
    final data = snapshot.data();
    if (data!["coupon_code"] == value) {
      isCouponApplied = true;
      state = AsyncData(isCouponApplied);
    } else {
      isCouponApplied = false;
      state = AsyncData(isCouponApplied);
    }
  }

  @override
  bool build() {
    return isCouponApplied;
  }
}

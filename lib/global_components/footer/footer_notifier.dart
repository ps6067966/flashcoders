import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'footer_model.dart';

final footerNotifierProvider =
    AsyncNotifierProvider<FooterNotifer, List<FooterModel>>(() {
  return FooterNotifer();
});

class FooterNotifer extends AsyncNotifier<List<FooterModel>> {
  List<FooterModel> footerList = [
    FooterModel(name: "FAQ", isHovering: false),
    FooterModel(name: "Contact us", isHovering: false),
    FooterModel(name: "Privacy Policy", isHovering: false),
    FooterModel(name: "Terms & Conditions", isHovering: false),
  ];

  updateHoveringStatus(index, value) {
    footerList[index].isHovering = value;
    state = AsyncData(footerList);
  }

  @override
  List<FooterModel> build() {
    return footerList;
  }
}

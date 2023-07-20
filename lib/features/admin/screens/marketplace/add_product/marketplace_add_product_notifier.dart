import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final addProductInMarketplaceNotifierProvider =
    AsyncNotifierProvider<AddProductInMarketplaceNotifier, AddProductModel>(() {
  return AddProductInMarketplaceNotifier();
});

class AddProductInMarketplaceNotifier extends AsyncNotifier<AddProductModel> {
  AddProductModel addProductModel = AddProductModel();

  pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      addProductModel = AddProductModel(image: bytes);
      state = AsyncData(addProductModel);
    }
  }

  @override
  AddProductModel build() {
    return addProductModel;
  }
}

class AddProductModel {
  final Uint8List? image;
  AddProductModel({
    this.image,
  });
}

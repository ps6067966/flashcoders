import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final addProductInMarketplaceNotifierProvider =
    AsyncNotifierProvider<AddProductInMarketplaceNotifier, AddProductModel>(() {
  return AddProductInMarketplaceNotifier();
});

class AddProductInMarketplaceNotifier extends AsyncNotifier<AddProductModel> {
  AddProductModel addProductModel = AddProductModel.instance();

  pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      addProductModel = AddProductModel(image: bytes);
      state = AsyncData(addProductModel);
    }
  }

  updateData(AddProductModel productValue) {
    addProductModel = productValue;
    state = AsyncData(addProductModel);
  }

  submitData() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await Future.delayed(const Duration(seconds: 2));
      return addProductModel;
    });
    
  }

  @override
  AddProductModel build() {
    return addProductModel;
  }
}

class AddProductModel {
  final String? name;
  final String? price;
  final String? productDescription;
  final String? productType;
  final String? productCategory;
  final Uint8List? image;

  AddProductModel({
    this.name,
    this.price,
    this.productDescription,
    this.productType,
    this.productCategory,
    this.image,
  });

  //singleton pattern
  static final AddProductModel _addProductModel = AddProductModel();

  factory AddProductModel.instance() => _addProductModel;

  //copy with
  AddProductModel copyWith({
    String? name,
    String? price,
    String? productDescription,
    String? productType,
    String? productCategory,
    Uint8List? image,
  }) {
    return AddProductModel(
      name: name ?? this.name,
      price: price ?? this.price,
      productDescription: productDescription ?? this.productDescription,
      productType: productType ?? this.productType,
      productCategory: productCategory ?? this.productCategory,
      image: image ?? this.image,
    );
  }
}

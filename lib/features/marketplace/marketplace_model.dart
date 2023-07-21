import 'package:cloud_firestore/cloud_firestore.dart';

class MarketplaceModel {
  final String? title;
  final String? price;
  final String? description;
  final String? imageUrl;

  MarketplaceModel({
    this.title,
    this.description,
    this.price,
    this.imageUrl,
  });

  MarketplaceModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot)
      : title = documentSnapshot["title"],
        price = documentSnapshot["price"],
        imageUrl = documentSnapshot["image_url"],
        description = documentSnapshot["description"];

  MarketplaceModel.fromMap(Map<String, dynamic> map)
      : title = map["title"],
        price = map["price"],
        imageUrl = map["image_url"],
        description = map["description"];

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "price": price,
      "description": description,
    };
  }
}

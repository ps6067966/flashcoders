import 'package:cloud_firestore/cloud_firestore.dart';

class MarketplaceModel {
  final int? id;
  final String? title;
  final String? price;
  final String? description;
  final String? imageUrl;

  MarketplaceModel({
    this.title,
    this.description,
    this.price,
    this.imageUrl,
    this.id,
  });

  MarketplaceModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot)
      : id = documentSnapshot["id"],
        title = documentSnapshot["title"],
        price = documentSnapshot["price"],
        imageUrl = documentSnapshot["image_url"],
        description = documentSnapshot["description"];

  MarketplaceModel.fromMap(Map<String, dynamic> map)
      : id = map["id"],
      title = map["title"],
        price = map["price"],
        imageUrl = map["image_url"],
        description = map["description"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "description": description,
    };
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class MarketplaceModel {
  final int? id;
  final String? title;
  final String? price;
  final String? description;
  final String? imageUrl;
  final String? link;
  final String? productType;

  MarketplaceModel({
    this.title,
    this.description,
    this.price,
    this.imageUrl,
    this.link,
    this.id,
    this.productType,
  });

  MarketplaceModel.fromDocumentSnapshot(DocumentSnapshot documentSnapshot)
      : id = documentSnapshot["id"],
        title = documentSnapshot["title"],
        price = documentSnapshot["price"],
        imageUrl = documentSnapshot["image_url"],
        link = documentSnapshot["link"],
        productType = documentSnapshot["product_type"],
        description = documentSnapshot["description"];

  MarketplaceModel.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        title = map["title"],
        price = map["price"],
        imageUrl = map["image_url"],
        description = map["description"],
        productType = map["product_type"],
        link = map["link"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "link": link,
    };
  }
}

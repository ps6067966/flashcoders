import 'package:cloud_firestore/cloud_firestore.dart';

class BlogModel {
  final int? userId;
  final int? id;
  final String? name;
  final String? email;
  final String? photoUrl;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;
  final String? post;
  final String? image;
  final String? title;
  BlogModel({
    this.userId,
    this.id,
    this.name,
    this.email,
    this.photoUrl,
    this.createdAt,
    this.updatedAt,
    this.post,
    this.image,
    this.title,
  });

  factory BlogModel.fromMap(Map<String, dynamic> map) {
    return BlogModel(
      userId: map['user_id'],
      id: map['id'],
      name: map['name'],
      email: map['email'],
      photoUrl: map['photo_url'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      post: map['post'],
      image: map['image'],
      title: map['title'],
    );
  }

  factory BlogModel.fromSnapshot(DocumentSnapshot snapshot) {
    return BlogModel(
      userId: snapshot['user_id'],
      id: snapshot['id'],
      name: snapshot['name'],
      email: snapshot['email'],
      photoUrl: snapshot['photo_url'],
      createdAt: snapshot['created_at'],
      updatedAt: snapshot['updated_at'],
      post: snapshot['post'],
      image: snapshot['image'],
      title: snapshot['title'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'id': id,
      'name': name,
      'email': email,
      'photo_url': photoUrl,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'post': post,
      'image': image,
      'title': title,
    };
  }
}

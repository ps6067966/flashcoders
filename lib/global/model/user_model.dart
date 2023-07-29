import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final int? userId;
  final String? uid;
  final String? name;
  final String? email;
  final String? photoUrl;
  final List<String>? roles;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;
  final bool? isAdmin;
  UserModel({
    this.userId,
    this.uid,
    this.name,
    this.email,
    this.isAdmin,
    this.photoUrl,
    this.roles,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['user_id'],
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      isAdmin: map['is_admin'],
      photoUrl: map['photo_url'],
      roles: List<String>.from(map['roles']),
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      userId: snapshot['user_id'],
      uid: snapshot['uid'],
      name: snapshot['name'],
      email: snapshot['email'],
      isAdmin: snapshot['is_admin'],
      photoUrl: snapshot['photo_url'],
      roles: List<String>.from(snapshot['roles']),
      createdAt: snapshot['created_at'],
      updatedAt: snapshot['updated_at'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'uid': uid,
      'name': name,
      'email': email,
      'photo_url': photoUrl,
      'roles': roles,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'is_admin': isAdmin ?? false,
    };
  }
}

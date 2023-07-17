import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final int? userId;
  final String? uid;
  final String? name;
  final String? email;
  final String? photoUrl;
  final List<String>? roles;
  final String? createdAt;
  final Timestamp? updatedAt;
  UserModel({
    this.userId,
    this.uid,
    this.name,
    this.email,
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
      photoUrl: map['photoUrl'],
      roles: List<String>.from(map['roles']),
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      userId: snapshot['user_id'],
      uid: snapshot['uid'],
      name: snapshot['name'],
      email: snapshot['email'],
      photoUrl: snapshot['photoUrl'],
      roles: List<String>.from(snapshot['roles']),
      createdAt: snapshot['createdAt'],
      updatedAt: snapshot['updatedAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'uid': uid,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'roles': roles,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}

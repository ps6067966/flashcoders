import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserApi {
  static final userCollection = FirebaseFirestore.instance.collection("user");
  static Future<void> updateUserDetails({
    required String name,
    required String email,
    required String uid,
    required String photoUrl,
    required List<String> roles,
  }) async {
    try {
      await userCollection.doc(email).set({
        "name": name,
        "email": email,
        "roles": roles,
        "uid": uid,
        "photoUrl": photoUrl,
        "timestamp": FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      log("$e");
    }
  }
}

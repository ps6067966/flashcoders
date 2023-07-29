import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../global/collections.dart';
import '../../../global/model/user_model.dart';

class UserApi {
  static Future<void> updateUserDetails({
    required String name,
    required String email,
    required String uid,
    required String photoUrl,
    required List<String> roles,
  }) async {
    try {
      final userData = await userCollection
          .orderBy("user_id", descending: true)
          .limit(1)
          .get();
      final user = UserModel.fromMap(userData.docs.first.data());
      if (user.userId == null) {
        return;
      }
      await userCollection.doc(email).update(
        {
          "name": name,
          "email": email,
          "roles": roles,
          "uid": uid,
          "photo_url": photoUrl,
          "updated_at": FieldValue.serverTimestamp(),
        },
      ).catchError((e) async {
        await userCollection.doc(email).set(
          {
            "user_id": user.userId! + 1,
            "name": name,
            "email": email,
            "roles": roles,
            "uid": uid,
            "photo_url": photoUrl,
            "created_at": FieldValue.serverTimestamp(),
            "updated_at": FieldValue.serverTimestamp(),
          },
        );
      });
    } catch (e) {
      log("$e");
    }
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:flashcoders/credentials.dart';

class UserApi {
  static Future<void> updateUserDetails({
    required String name,
    required String email,
    required String uid,
    required String photoUrl,
    required List<String> roles,
  }) async {
    try {
      final result = await supabase.from("flash-users").insert({
        "name": name,
        "email": email,
        "uid": uid,
        "photo_url": photoUrl,
        "roles": jsonEncode(roles),
      }).select();
      log("$result");
    } catch (e) {
      log("$e");
    }
  }
}

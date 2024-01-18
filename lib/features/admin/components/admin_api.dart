import 'package:flashcoders/credentials.dart';
import 'package:flashcoders/global/model/user_model.dart';

class AdminApi {
  static Future<UserModel?> getCurrentUserData() async {
    final data = await supabase.rest
        .from("flash-users")
        .select()
        .match({"email": supabase.auth.currentUser?.email ?? ""}).limit(1);
    final userData = data.map((e) => UserModel.fromMap(e)).toList();
    return userData.first;
  }
}

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:get/get.dart';
import 'package:ride_share/services/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';


class JwtDecoder {
  static Future<String?> extractUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');  // Retrieve access token

    if (token == null) {
      await StorageService.clearUserInfo();     // delete previous access token
      return Get.offNamed('/login');    // redirect user to the login screen
    }
    
    final jwt = JWT.decode(token);
    final userID = jwt.payload['user'];  // extract user ID in the token payload

    if (userID == null) {
      return Future.error("User ID not found in token.");
    }

    return userID;
  }
}

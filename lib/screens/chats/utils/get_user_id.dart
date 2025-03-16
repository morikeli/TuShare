import 'package:ride_share/utils/jwt_decoder.dart';

class GetUserId {
  static Future<String?> currentUserID() async {
    String? userID = await JwtDecoder.extractUserID();  // Get user ID from token
    return userID;
  }
}

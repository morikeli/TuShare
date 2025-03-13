import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';


final logger = Logger('Storage_Services');

class StorageService {
  // get access token
  static Future<Map<String, String>> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'access_token': prefs.getString('access_token') ?? '',
    };
  }

  // save user access token from response data
  static Future<void> saveUserInfo(Map<String, dynamic> user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', user['access_token']);

  }

  static Future<void> clearUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}

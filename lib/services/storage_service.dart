import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';


final logger = Logger('Storage_Services');

class StorageService {

  // log user info - for debugging
  static Future<void> printUserInfo() async {
    final prefs = await SharedPreferences.getInstance();

    // Retrieve the values from shared preferences
    String? accessToken = prefs.getString('access_token');
    String? lastLogin = prefs.getString('last_login');
    
    // Show logs at the terminal
    logger.info('Access token: $accessToken');
    logger.info('Last login: $lastLogin');
  }


  // get access token
  static Future<Map<String, String>> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'access_token': prefs.getString('access_token') ?? '',
      'last_login': prefs.getString('last_login') ?? ''
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

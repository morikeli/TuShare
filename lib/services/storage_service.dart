import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';


final logger = Logger('Storage_Services');

class StorageService {

  // log user info - for debugging
  static Future<void> printUserInfo() async {
    final prefs = await SharedPreferences.getInstance();

    // Retrieve the values from shared preferences
    String? username = prefs.getString('username');
    String? firstName = prefs.getString('first_name');
    String? lastName = prefs.getString('last_name');
    String? email = prefs.getString('email');
    String? profileImage = prefs.getString('profile_picture');
    String? dateJoined = prefs.getString('date_joined');
    
    // Show logs at the terminal
    logger.info('Username: $username');
    logger.info('First Name: $firstName');
    logger.info('Last Name: $lastName');
    logger.info('Email: $email');
    logger.info('Profile Image URL: $profileImage');
    logger.info('Date joined: $dateJoined');
  }


  // get user details from API response
  static Future<Map<String, String>> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'username': prefs.getString('username') ?? '',
      'first_name': prefs.getString('first_name') ?? '',
      'last_name': prefs.getString('last_name') ?? '',
      'email': prefs.getString('email') ?? '',
      'profile_picture': prefs.getString('profile_picture') ?? '',
      'date_joined': prefs.getString('date_joined') ?? '',
    };
  }

  // save user info from response data
  static Future<void> saveUserInfo(Map<String, dynamic> user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', user['username']);
    await prefs.setString('first_name', user['first_name']);
    await prefs.setString('last_name', user['last_name']);
    await prefs.setString('email', user['email']);
    await prefs.setString('profile_picture', user['profile_picture']);
    await prefs.setString('date_joined', user['date_joined']);

  }

  static Future<void> clearUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}

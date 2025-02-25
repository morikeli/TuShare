import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String baseURL = dotenv.env['API_URL'] ?? 'http://localhost:8000/token/';
  static String login = '$baseURL/api/v1/auth/login/';
  static String signup = '$baseURL/api/v1/auth/signup/';
  static String editUserProfile = '$baseURL/api/v1/users/profile/edit/';
  static String userProfile = '$baseURL/api/v1/users/profile/';
  static String mediaURL = baseURL;
}

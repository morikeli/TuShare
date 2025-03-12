import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String baseURL = dotenv.env['API_URL'] ?? 'http://localhost:8000/token/';
  static String mediaURL = baseURL;

  // authentication endpoints
  static String login = '$baseURL/api/v1/auth/login';
  static String signup = '$baseURL/api/v1/auth/signup';
  static String logout = '$baseURL/api/v1/auth/logout';

  // user profile management endpoints
  static String editUserProfile = '$baseURL/api/v1/users/profile/edit';
  static String userProfile = '$baseURL/api/v1/users/profile';

  // rides management endpoints
  static String getRides = '$baseURL/api/v1/rides';
  static String bookedRides = '$baseURL/api/v1/rides/booked';
  static String shareRide = '$baseURL/api/v1/rides/new-ride';
  static String bookRide = '$baseURL/api/v1/';

  // messages endpoints
  static String getMessages = '$baseURL/api/v1/message';
  static String sendMessage = '$baseURL/api/v1/message';    // .../message/:id/send
}

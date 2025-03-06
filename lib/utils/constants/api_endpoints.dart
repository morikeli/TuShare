import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static String baseURL = dotenv.env['API_URL'] ?? 'http://localhost:8000/token/';
  static String login = '$baseURL/api/v1/auth/login';
  static String signup = '$baseURL/api/v1/auth/signup';
  static String logout = '$baseURL/api/v1/auth/logout';
  static String editUserProfile = '$baseURL/api/v1/users/profile/edit';
  static String userProfile = '$baseURL/api/v1/users/profile';
  static String getRides = '$baseURL/api/v1/rides';
  static String bookedRides = '$baseURL/api/v1/rides/booked';
  static String shareRide = '$baseURL/api/v1/rides/new-ride';
  static String bookRide = '$baseURL/api/v1/';
  static String mediaURL = baseURL;
}

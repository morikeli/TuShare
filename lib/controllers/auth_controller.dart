import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:logging/logging.dart';
import 'package:ride_share/services/storage_service.dart';
import 'package:ride_share/utils/constants/api_endpoints.dart';


final logger = Logger('AuthController');

class AuthController {
  // method to login users
  static Future<Map<String, dynamic>?> login(String username, String password) async {
    await dotenv.load(); // Load .env file
    final url = Uri.parse(ApiConstants.login);

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'username': username,
          'password': password,
        },
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final accessToken = data['access_token'];
        final user = data['user'];

          return {
            'access_token': accessToken,
            'user': user,
          };

      } else {
        return null;
      }
    } catch (e) {
      logger.shout('[Auth Error]: $e');
      return null; 
    }
  }


  // method to create an account for a user
  static Future<Map<String, dynamic>?> signup(String firstName, String lastName, String username, String email, String gender, String password, File? profileImage) async {
    await dotenv.load();    // load .env file
    final uri = Uri.parse(ApiConstants.signup);
    final request = http.MultipartRequest('POST', uri);

    // Send form data in request body
    request.fields['first_name'] = firstName;
    request.fields['last_name'] = lastName;
    request.fields['username'] = username;
    request.fields['email'] = email;
    request.fields['gender'] = gender;
    request.fields['password'] = password;

    // Add image if selected
    if (profileImage != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'profile_image',
        profileImage.path,
        contentType: MediaType('image', 'jpeg'),
      ));
    }

    try {
      final response = await request.send().timeout(Duration(seconds: 15));
      print('Response: $response');
      if (response.statusCode == 201) {
        final responseData = await response.stream.bytesToString();
        return json.decode(responseData);
      } else {
        // show log for debugging
        logger.severe('[STATUS CODE]: HTTP ${response.statusCode} ${response.reasonPhrase}');
        final responseBody = await response.stream.bytesToString();
        logger.severe('Response body: $responseBody');

        return null;
      }
    } catch (e) {
      logger.shout('[Signup Error]: $e');
      return null;
    }
  }

  // method to logout a signed in user
  Future<void> logout() async {
    await StorageService.clearUserInfo();
    Get.offNamed('/login');
  }

}

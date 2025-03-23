import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:logging/logging.dart';
import 'package:ride_share/common/widgets/custom_snackbar.dart';
import 'package:ride_share/services/storage_service.dart';
import 'package:ride_share/utils/constants/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';


final logger = Logger('AuthController');

class AuthController {  
  // method to login users
  static Future<Map<String, dynamic>?> login(String username, String password) async {
    await dotenv.load(); // Load .env file
    final url = Uri.parse(ApiConstants.login);
    var isLoading = false.obs;

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {
          'username': username,
          'password': password,
        },
      ).timeout(Duration(minutes: 3));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final accessToken = data['access_token'];

        return {'access_token': accessToken};

      } else {
        return null;
      }
    } on TimeoutException catch(timeoutError) {
      isLoading(false);
      throw Exception('$timeoutError');
    } on http.ClientException catch(e) {
      throw Exception('$e');
    } catch (e) {
      logger.shout('[Auth Error]: $e');
      return null; 
    } finally {
      Get.offNamed('/login');
    }
  }


  // method to create an account for a user
  static Future<Map<String, dynamic>?> signup(String firstName, String lastName, String username, String email, String mobileNumber, String gender, String password, File? profileImage) async {
    await dotenv.load();    // load .env file
    final uri = Uri.parse(ApiConstants.signup);
    final request = http.MultipartRequest('POST', uri);
    var isLoading = false.obs;

    // Send form data in request body
    request.fields['first_name'] = firstName;
    request.fields['last_name'] = lastName;
    request.fields['username'] = username;
    request.fields['mobile_number'] = mobileNumber;
    request.fields['email'] = email;
    request.fields['gender'] = gender;
    request.fields['password'] = password;

    // Add image if selected
    if (profileImage != null) {
      String extension = profileImage.path.split('.').last.toLowerCase();     // Get the image file extension
      String mimeType;   // Determine the correct MIME type
      
      if (extension == 'jpg' || extension == 'jpeg') {
        mimeType = 'jpeg';
      } else if (extension == 'png') {
        mimeType = 'png';
      } else {
        throw Exception('Unsupported file format');
      }

      request.files.add(await http.MultipartFile.fromPath(
        'profile_image',
        profileImage.path,
        contentType: MediaType('image', mimeType),
      ));
    }

    try {
      final response = await request.send().timeout(Duration(minutes: 3));
      final responseData = await response.stream.bytesToString();
      
      if (response.statusCode == 201) {
        return json.decode(responseData);
      
      } else {
        logger.severe('[STATUS CODE]: HTTP ${response.statusCode} ${response.reasonPhrase}');   // show log for debugging

        // use try ... catch block to display response data
        try {
          // final responseBody = json.decode(responseData);
          // print('Decoded Response: $responseBody'); 

          // response JSON data, status code and status message, e.g. NOT_FOUND, CREATED or UNAUTHORIZED
          throw Exception('Response: $responseData | Status code: ${response.statusCode}_${response.reasonPhrase}');
          
        } catch (err) {
          throw Exception('Failed to parse error response: $err');    // if response couldn't be parsed
        }
      }
    } on TimeoutException catch(timeoutError) {
      isLoading(false);
      throw Exception('$timeoutError');
    } on http.ClientException catch(e) {
      throw Exception('$e');
    } catch (error) {
      logger.shout('[Signup Error]: $error');
      Exception('[ERROR]: $error');
      return null;
    } finally {
      Get.offNamed('/signup');
    }
  }

  // method to logout a signed in user
  Future<void> logout() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('access_token');    // get access token
      

      if (token == null) {
        return Get.offAllNamed('/login');       // Remove all routes and navigate to login
      }

      // Make the logout request
      final response = await http.post(
        Uri.parse(ApiConstants.logout),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Logout successful, clear user info
        await StorageService.clearUserInfo();
        Get.offAllNamed('/login');        // Remove all routes and navigate to login
      } else {
        // Handle logout failure
        final Map<String, dynamic> responseBody = json.decode(response.body);
        final RxMap<String, dynamic> errorMessage = {"title": "Error", "message": "${responseBody['detail']}", "type": ContentType.failure}.obs;
        CustomSnackbar(snackbarMessage: errorMessage);
      }
    } catch (e) {
      RxMap<String, dynamic> errorMessage = {"title": "Error", "message": "$e", "type": ContentType.failure}.obs;
      CustomSnackbar(snackbarMessage: errorMessage);
    }
  }
}

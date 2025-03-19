import 'dart:convert';
import 'dart:io';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ride_share/models/user_profile.dart';
import 'package:ride_share/services/storage_service.dart';
import 'package:ride_share/utils/constants/api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:ride_share/utils/network_util.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfileController extends GetxController {
  // Controllers for form fields, i.e. EditProfileForm()
  final usernameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final homeAddressController = TextEditingController();
  final workAddressController = TextEditingController();
  final facebookController = TextEditingController();
  final instagramController = TextEditingController();
  final twitterController = TextEditingController();
  final bioController = TextEditingController();

  final RxMap<String, String> userInfo = <String, String>{}.obs;
  var selectedImage = Rx<File?>(null);
  var userProfile = Rxn<UserProfile>();
  var isLoading = false.obs;
  var errorMessage = <String, dynamic>{}.obs;

  @override
  void onInit() {
    fetchuserProfile();
    super.onInit();
  }

  @override
  void onClose() {
    usernameController.dispose();
    mobileNumberController.dispose();
    homeAddressController.dispose();
    workAddressController.dispose();
    facebookController.dispose();
    instagramController.dispose();
    twitterController.dispose();
    bioController.dispose();
    super.onClose();
  }

  // select image file from edit profile form

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
      update(); // Refresh UI after picking the image
    } else {
      errorMessage({
        'title': 'Oops!',
        'message': 'Please select an image file.',
        'type': ContentType.warning,
      }).toString();
    }
  }

  // show snackbar
  Future<void> fetchuserProfile() async {
    // check connectivity before making a request
    if (!NetworkUtils.checkInternet()) return;       // Stop if there's no connectivity
    
    isLoading(true);
    void showErrorSnackbar(String title, String message) {
      Get.showSnackbar(
        GetSnackBar(
          backgroundColor: Colors.transparent,
          duration: Duration(seconds: 7),
          messageText: AwesomeSnackbarContent(
            title: title,
            message: message,
            messageTextStyle: TextStyle(fontSize: 14.0),
            contentType: ContentType.failure,
          ),
        ),
      );
    }

    try {
      isLoading(true);
      final token = await StorageService.getUserInfo();
      final response = await http.get(
        Uri.parse(ApiConstants.userProfile),
        headers: {
          'Authorization': 'Bearer ${token["access_token"]}',
          'Content-Type': 'application/json',
        },
      ).timeout(Duration(seconds: 15));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        /*
          Once the response is recieved, retrieve each field in the  JSON data and
          save in TextEditingController of the edit profile form. If the field is null, 
          save it as an empty string.

          The aim of doing this is to make the user aware of what's saved in the database.
        */
        usernameController.text = data["username"] ?? "";
        mobileNumberController.text = data["mobile_number"] ?? "";
        homeAddressController.text = data["home_address"] ?? "";
        workAddressController.text = data["work_address"] ?? "";
        facebookController.text = data["facebook_handle"] ?? "";
        instagramController.text = data["instagram_handle"] ?? "";
        twitterController.text = data["twitter_handle"] ?? "";
        bioController.text = data["bio"] ?? "";

        userProfile.value = UserProfile.fromJson(data);   // update user profile with the JSON data from UserProfile model
        update(); // notify UI to update
      } else {
        errorMessage({
          "title": 'Oh snap! 😔',
          "message": "Your session has expired. Please log in to your account.",
          "type": ContentType.warning,
        });  // in most cases an expired token
        Get.offNamed('/login'); // redirect user to login screen
        logger.warning(response.body); // log the error in terminal
      }
    } catch (e) {
      logger.shout('[EXCEPTION]: $e');
      showErrorSnackbar("ERROR!", "Couldn't fetch your profile info.");
    } finally {
      isLoading(false);
    }
  }

  // method to update user profile
  Future<void> updateProfile() async {
    // check connectivity before making a request
    if (!NetworkUtils.checkInternet()) return;       // Stop if there's no connectivity

    isLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');

    if (token == null) return Get.offNamed('/login');   // if there is no access token, reidrect user to login screen 

    final Map<String, String> profileData = {
      "username": usernameController.text,
      "mobile_number": mobileNumberController.text,
      "home_address": homeAddressController.text,
      "work_address": workAddressController.text,
      "facebook_handle": facebookController.text,
      "instagram_handle": instagramController.text,
      "twitter_handle": twitterController.text,
      "bio": bioController.text,
    };

    final request = http.MultipartRequest('PUT', Uri.parse(ApiConstants.editUserProfile));
    request.headers['Authorization'] = 'Bearer $token';
    request.fields['profile_data'] = jsonEncode(profileData);   // Add profile data as a JSON string
    
    // Attach image if selected
    if (selectedImage.value != null) {
      String extension = selectedImage.value!.path.split('.').last.toLowerCase(); // Get the image file extension
      String mimeType; // Determine the correct MIME type

      if (extension == 'jpg' || extension == 'jpeg') {
        mimeType = 'jpeg';
      } else if (extension == 'png') {
        mimeType = 'png';
      } else {
        throw Exception('Unsupported file format');
      }

      request.files.add(
        await http.MultipartFile.fromPath(
          'profile_pic',
          selectedImage.value!.path,
          contentType: MediaType('img', mimeType),
        ),
      );
    }
    

    try {
      final streamedResponse = await request.send().timeout(Duration(seconds: 15));
      final response = await http.Response.fromStream(streamedResponse);
      isLoading(false);

      if (response.statusCode == 200) {
        await fetchuserProfile();     // if successful, refresh data in profile screen
        // update errorMessage object with success message if the user profile was updated successfully
        errorMessage({
          "title": 'Wohoo! 🥳🥳',
          "message": "Your profile was updated succesfully!",
          "type": ContentType.success,
        });
      } else {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        String responseMessage = responseData["detail"] ?? "An error occurred";
        errorMessage({
          "title": 'Oh snap! 😔',
          "message": responseMessage,
          "type": ContentType.warning,
        });

        throw Exception('[ERROR]: $responseMessage | Status code: ${response.statusCode}');
      }
    } on http.ClientException catch (e) {
      // if there is no internet connection display this error message
      errorMessage({
        "title": 'Oh snap! 😔',
        "message": "Can't to update your profile at this moment. Please try again",
        "type": ContentType.failure,
      });
      throw Exception('[NETWORK CONNECTIVITY ERROR]: $e');
    } catch (e) {
      throw Exception('[ERROR]: $e');
    }
  }
}

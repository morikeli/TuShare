import 'dart:io';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logging/logging.dart';
import 'package:ride_share/controllers/auth_controller.dart';


final logger = Logger('SignupController');


class SignupController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final emailController = TextEditingController();
  final genderController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var selectedImage = Rx<File?>(null);
  var selectedGender = 'Male'.obs;
  var isLoading = false.obs;
  var errorMessage = {}.obs;

  // method to pick an image from the gallery
  Future<void> pickImage() async {
    await dotenv.load(); // load .env file
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

  // method to handle signup
  Future<void> signup() async {
    isLoading(true);
    final firstName = firstNameController.text.trim();
    final lastName = lastNameController.text.trim();
    final username = usernameController.text.trim();
    final mobileNumber = mobileNumberController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    // form validation
    if (firstName.isEmpty || lastName.isEmpty || username.isEmpty || email.isEmpty || mobileNumber.isEmpty || selectedGender.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      
      isLoading(false);
      errorMessage({
        'title': 'Yoh! 🤨',
        'message': 'All fields are required.',
        'type': ContentType.warning,
      }).toString();

      return;
      
    } else if (password.length < 8) {
      isLoading(false);
      errorMessage({
        'title': 'Wiih! 😵‍💫',
        'message': "That's a very weak password.",
        'type': ContentType.warning,
      }).toString();

      return;

    } else if (password != confirmPassword) {
      isLoading(false);
      errorMessage({
        'title': 'Oh snap! 😵',
        'message': "Passwords don't match",
        'type': ContentType.warning,
      }).toString();

      return;
    }

    // if form validation is valid, create a user account
    final signupData = await AuthController.signup(firstName, lastName, username, email, mobileNumber, selectedGender.value, password, selectedImage.value);

    logger.info('[SIGNUP DATA]: $signupData');
    if (signupData != null) {
      errorMessage({
        'title': 'Wohoo! 🥳🥳',
        'message': 'Account created successfully!',
        'type': ContentType.success,
      }).toString();
      isLoading(false);
      Get.offNamed('/login');

    } else {
      errorMessage({
        'title': 'Oh snap!',
        'message': 'Something went wrong. Please try again',
        'type': ContentType.failure,
      }).toString();
      isLoading(false);
      
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share/services/storage_service.dart';
import 'auth_controller.dart';


class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> login() async {
    isLoading(true);
    errorMessage('');

    final authData = await AuthController.login(
      usernameController.text,
      passwordController.text,
    );

    // if auth is successful, redirect to homescreen, otherwise display an error message
    if (authData != null) {
      // Save user info in local storage
      await StorageService.saveUserInfo(authData);
      isLoading(false);   // set isLoading to false
      Get.offNamed('/home');    // redirect user to the homescreen
    
    } else {
      // set isLoading to false, redirect to login screen and display the error to the user
      isLoading(false);
      Get.offNamed('/login');
      errorMessage('Enter correct username or password.');
    }
  }
}

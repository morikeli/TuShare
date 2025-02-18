import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';


class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> login() async {
    isLoading(true);
    errorMessage('');

    final success = await AuthController.login(
      usernameController.text,
      passwordController.text,
    );

    isLoading(false);   // set isLoading to false

    // if auth is successful, redirect to homescreen, otherwise display an error message
    if (success) {
      Get.offNamed('/home');
    } else {
      errorMessage('Enter correct username or password.');
    }
  }
}

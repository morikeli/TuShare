import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ride_share/controllers/signup_controller.dart';
import 'package:ride_share/screens/signup/components/signup_form.dart';
import 'package:ride_share/utils/constants/colors.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Create an account')),
      body: Obx(
        () => signupController.isLoading.value
            ? Center(
                child: SpinKitFadingCircle(
                  color: kPrimaryColor,
                  size: 68.0,
                ),
              )
            : SignupForm(signupController: signupController),
      ),
    );
  }
}

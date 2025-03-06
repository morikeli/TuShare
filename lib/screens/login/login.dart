import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/controllers/login_controller.dart';
import 'package:ride_share/screens/login/components/login_form.dart';
import 'package:ride_share/utils/constants/colors.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: loginScreenAppBar(context),
      body: Obx(() => loginController.isLoading.value
          // if app is waiting for API response, display a progress indicator
          ? loadingIndicator()
          // otherwise, display a login form
          : ListView(
              children: [
                LoginForm(), // login form
                signupLink(),
              ],
            )), // login form
    );
  }

  AppBar loginScreenAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(LineIcons.alternateCar),
          SizedBox(width: 5.0),
          Text('TuShare', style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }

  Center loadingIndicator() {
    return Center(
      child: SpinKitFadingCircle(
        color: kPrimaryColor,
        size: 68.0,
      ),
    );
  }

  Text signupLink() {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text: "Don't have an account? Click here to ",
        style:
            TextStyle(color: kTextSecondaryColor, fontSize: 14.0),
        children: [
          TextSpan(
            text: 'signup',
            recognizer: TapGestureRecognizer()
              ..onTap = () => Get.toNamed('/signup'),
            style: TextStyle(color: kPrimaryColor, fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}

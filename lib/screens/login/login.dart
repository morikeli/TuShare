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
  // final bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => loginController.isLoading.value
          // if `isLoading` is true, display a progress indicator
          ? loadingScreen(context)
          // otherwise show a login form
          : defaultLoginScreen(context),
    );
  }

  Scaffold defaultLoginScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(LineIcons.alternateCar),
            SizedBox(width: 5.0),
            Text('TuShare', style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
      body: LoginForm(), // login form
    );
  }

  Scaffold loadingScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(LineIcons.alternateCar),
            SizedBox(width: 5.0),
            Text(
              'TuShare',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
      body: Center(
        child: SpinKitFadingCircle(
          color: kPrimaryColor,
          size: 68.0,
        ),
      ),
    );
  }
}

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/controllers/login_controller.dart';
import 'package:ride_share/utils/constants/colors.dart';


class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Login in to your account',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 12.0),
            usernameAndEmailTextField(),
            SizedBox(height: 16.0),
            passwordTextField(),
            SizedBox(height: 20),
            loginBtn(),
            CustomSnackbar(snackbarMessage: loginController.errorMessage),
          ],
        ),
      ),
    );
  }

  SizedBox loginBtn() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: loginController.login,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(kPrimaryColor),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        ),
        child: Text(
          'Login',
          style: TextStyle(color: kTextLightColor),
        ),
      ),
    );
  }

  TextField passwordTextField() {
    return TextField(
      controller: loginController.passwordController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: "Password",
        hintText: "Enter your password",
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 4.0),
          child: Icon(LineIcons.lock),
        ),
      ),
      obscureText: true,
    );
  }

  TextField usernameTextField() {
    return TextField(
      controller: loginController.usernameController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: "Username",
        hintText: "Enter your username",
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 4.0),
          child: Icon(LineIcons.user),
        ),
      ),
    );
  }
}

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
            usernameTextField(),
            SizedBox(height: 16.0),
            passwordTextField(),
            SizedBox(height: 20),
            loginBtn(),
            // Spacer(),
            Obx(
              () {
                if (loginController.errorMessage.value.isNotEmpty) {
                  /* 
                    Unhandled Exception: visitChildElements() called during build. 
                    
                    The error mentioned above occurs when you're trying to perform actions involving child widgets
                    (like showing a Snackbar) during the build process. This is not allowed because the widget tree
                    is still being updated and children are not yet ready to be interacted with.

                    To counter this, post-frame callback is used to display the Snackbar() after the entire widget tree is built.
                  */
                  // Use post-frame callback to show snackbar after the frame is built
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Get.showSnackbar(
                      GetSnackBar(
                        backgroundColor: Colors.transparent,
                        duration: Duration(seconds: 7),
                        messageText: AwesomeSnackbarContent(
                          title: 'Oops! Invalid credentials.',
                          message: '${loginController.errorMessage}',
                          messageTextStyle: TextStyle(fontSize: 14.0),
                          contentType: ContentType.failure,
                        ),
                      ),
                    );
                  });
                } else {
                  Get.closeCurrentSnackbar();
                }
                
                return SizedBox.shrink();
              },
            ),
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

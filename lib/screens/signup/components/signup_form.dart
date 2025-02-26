import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/controllers/signup_controller.dart';
import 'package:ride_share/utils/constants/colors.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
    required this.signupController,
  });

  final SignupController signupController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Fill the form below with your credentials',
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            userProfilePicInputField(), // allows users to attach a profile pic in the form
            SizedBox(height: 16.0),
            firstNameTextField(),
            SizedBox(height: 16.0),
            lastNameTextField(),
            SizedBox(height: 16.0),
            usernameTextField(), // Username input field
            SizedBox(height: 16.0),
            emailTextField(), // email address text field
            SizedBox(height: 16.0),
            mobileNumberTextField(), // mobile number text field
            SizedBox(height: 16.0),
            genderTextField(),
            SizedBox(height: 16.0),
            passwordTextField(), // password text field
            SizedBox(height: 16.0),
            confirmPasswordTextField(), // confirm password text field
            SizedBox(height: 16.0),

            // Obx to show error message if any
            Obx(
              () {
                if (signupController.errorMessage.isNotEmpty) {
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
                          title: signupController.errorMessage["title"],
                          message:
                              '${signupController.errorMessage["message"]}',
                          messageTextStyle: TextStyle(fontSize: 14.0),
                          contentType: signupController.errorMessage["type"],
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

            // Signup Button
            signupBtn()
          ],
        ),
      ),
    );
  }

  SizedBox signupBtn() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: signupController.signup,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(kPrimaryColor),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        ),
        child: Text(
          'Signup',
          style: TextStyle(color: kTextLightColor),
        ),
      ),
    );
  }

  TextField confirmPasswordTextField() {
    return TextField(
      controller: signupController.confirmPasswordController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: "Confirm password",
        hintText: "Confirm your password",
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 4.0),
          child: Icon(LineIcons.lock),
        ),
      ),
      obscureText: true,
    );
  }

  TextField passwordTextField() {
    return TextField(
      controller: signupController.passwordController,
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
          child: Icon(LineIcons.key),
        ),
      ),
      obscureText: true,
    );
  }

  Obx genderTextField() {
    return Obx(
      () => DropdownButtonFormField<String>(
        value: signupController.selectedGender.value,
        decoration: InputDecoration(
          labelText: 'Gender',
          border: OutlineInputBorder(),
          prefixIcon: Icon(LineIcons.venusMars),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        items: ['Male', 'Female'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            signupController.selectedGender.value = newValue;
          }
        },
      ),
    );
  }

  TextField mobileNumberTextField() {
    return TextField(
      controller: signupController.mobileNumberController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: "Mobile number",
        hintText: "Enter your mobile number",
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 4.0),
          child: Icon(LineIcons.phone),
        ),
      ),
    );
  }

  TextField emailTextField() {
    return TextField(
      controller: signupController.emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: "Email",
        hintText: "Enter your email address",
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 4.0),
          child: Icon(LineIcons.envelope),
        ),
      ),
    );
  }

  TextField usernameTextField() {
    return TextField(
      controller: signupController.usernameController,
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
          child: Icon(LineIcons.tag),
        ),
      ),
    );
  }

  TextField lastNameTextField() {
    return TextField(
      controller: signupController.lastNameController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: "Last name",
        hintText: "Enter your last name",
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 4.0),
          child: Icon(LineIcons.userCircle),
        ),
      ),
    );
  }

  TextField firstNameTextField() {
    return TextField(
      controller: signupController.firstNameController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: "First Name",
        hintText: "Enter your first name",
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 4.0),
          child: Icon(LineIcons.user),
        ),
      ),
    );
  }

  Center userProfilePicInputField() {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Obx(() {
            return CircleAvatar(
              backgroundImage: signupController.selectedImage.value != null
                  ? FileImage(signupController
                      .selectedImage.value!) // Display the selected image
                  : AssetImage('assets/images/dps/default.png')
                      as ImageProvider,
              radius: 44.0,
            );
          }),
          Positioned(
            top: 48,
            left: 48,
            child: IconButton.filled(
              onPressed: signupController.pickImage,
              icon: Icon(LineIcons.camera, color: kIconLightColor, size: 16.0),
            ),
          )
        ],
      ),
    );
  }
}

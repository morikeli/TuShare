import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/controllers/profile_controller.dart';
import 'package:ride_share/screens/profile/components/profile_screen/profile_screen_body.dart';
import 'package:ride_share/utils/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController profileController = Get.put(ProfileController());


  @override
  Widget build(BuildContext context) {
    final profile = profileController.userProfile.value;

    return Scaffold(
      body: SafeArea(
        child: ProfileScreenBody(),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Edit profile',
        onPressed: () {
          if (profile == null) {
            // do nothing
          } else {
            Get.toNamed('/edit-profile');
          }
        },  // Navigate to Edit Profile screen,
        child: Icon(
          LineIcons.userEdit,
          color: kIconLightColor,
        ),
      ),
    );
  }
}

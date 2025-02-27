import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/common/widgets/custom_snackbar.dart';
import 'package:ride_share/controllers/profile_controller.dart';
import 'package:ride_share/screens/profile/components/edit_profile/edit_profile_form.dart';
import 'package:ride_share/utils/constants/api_endpoints.dart';
import 'package:ride_share/utils/constants/colors.dart';

class EditProfileScreenBody extends StatelessWidget {
  EditProfileScreenBody({super.key});
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (profileController.isLoading.value) {
        return Center(
          child: SpinKitFadingCircle(color: kPrimaryColor, size: 68.0),
        );
      }

      return Scrollbar(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
          child: ListView(
            children: [
              userProfilePicture(context),
              EditProfileForm(),
              CustomSnackbar(snackbarMessage: profileController.errorMessage),
            ],
          ),
        ),
      );
    });
  }

  Widget userProfilePicture(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            /* 
              If no image is selected from the gallery,
              set the current picture to the user's profile picture otherwise
              set it to the profile picture selected from the gallery.
            */
            backgroundImage: _selectedImageFile != null
                ? FileImage(_selectedImageFile!)
                : AssetImage('assets/images/dps/6.jpg'),
            radius: MediaQuery.of(context).size.width * .16,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton.filled(
              tooltip: 'Edit profile photo',
              onPressed: pickImage,
              icon: Icon(LineIcons.camera, color: kIconLightColor),
            ),
          ),
        ],
      ),
    );
  }
}

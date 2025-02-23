import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/screens/profile/components/edit_profile/edit_profile_form.dart';
import 'package:ride_share/utils/constants/colors.dart';

class EditProfileScreenBody extends StatefulWidget {
  const EditProfileScreenBody({super.key});

  @override
  State<EditProfileScreenBody> createState() => _EditProfileScreenBodyState();
}

class _EditProfileScreenBodyState extends State<EditProfileScreenBody> {
  File? _selectedImageFile;

  Future pickImage() async {
    // initialize picker object
    final ImagePicker picker = ImagePicker();

    // pick image from gallery
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    // update image preview
    if (image != null) {
      setState(() {
        _selectedImageFile = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
      child: ListView(
        children: [
          userProfilePicture(context),
          EditProfileForm(),
        ],
      ),
    );
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

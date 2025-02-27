import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/controllers/profile_controller.dart';
import 'package:ride_share/utils/constants/colors.dart';


class EditProfileForm extends StatelessWidget {
  EditProfileForm({
    super.key,
  });
  final _formKey = GlobalKey<FormState>();
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. username
          UsernameFormField(usernameController:  controller.usernameController),
          // 2. mobile no.
          MobileNoFormField(mobileNumberController: controller.mobileNumberController),
          // 3. home address
          HomeAddressFormField(homeAddressController: controller.homeAddressController),
          // 4. work address
          WorkAddressFormField(workAddressController: controller.workAddressController),
          // 5. facebook handle
          FacebookHandleFormField(fbHandleController: controller.facebookController),
          // 6. instagram handle
          InstagramFormField(instagramHandleController: controller.instagramController),
          // 7. X(formerly twitter) handle
          TwitterFormField(twitterHandleController: controller.twitterController),
          SizedBox(height: 16.0),
          // 8. Bio
          UserBioFormField(bioController: controller.bioController),
          SizedBox(height: 12.0),   // add spacing between the last input field and the button
          UpdateProfileBtn(onBtnPressed: controller.updateProfile),
        ],
      ),
    );
  }
}

class UpdateProfileBtn extends StatelessWidget {
  const UpdateProfileBtn({
    super.key,
    required this.onBtnPressed,
  });

  final void Function() onBtnPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 28.0,
      width: MediaQuery.of(context).size.width * .64,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(kPrimaryColor),
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 2.0)),
          shape: WidgetStatePropertyAll(BeveledRectangleBorder(borderRadius: BorderRadius.circular(2.0))),
        ),
        onPressed: onBtnPressed,
        child: Text('Update profile', style: TextStyle(color: kTextLightColor)),
      ),
    );
  }
}

class UserBioFormField extends StatelessWidget {
  const UserBioFormField({
    super.key,
    required this.bioController,
  });

  final TextEditingController bioController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(LineIcons.user),
        SizedBox(width: 12.0),
        SizedBox(
          width: MediaQuery.of(context).size.width * .6,
          child: TextField(
            controller: bioController,
            maxLines: 5,
            minLines: 1,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(2.0),
              hintText: 'Bio',
              labelStyle: TextStyle(
                fontSize: 13.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TwitterFormField extends StatelessWidget {
  const TwitterFormField({
    super.key,
    required this.twitterHandleController,
  });

  final TextEditingController twitterHandleController;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(LineIcons.twitter),
        SizedBox(width: 12.0),
        SizedBox(
          width: MediaQuery.of(context).size.width * .6,
          child: TextField(
            controller: twitterHandleController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(2.0),
                hintText: 'X (formely Twitter) handle',
                labelStyle: TextStyle(
                  fontSize: 13.0,
                )),
          ),
        ),
      ],
    );
  }
}

class InstagramFormField extends StatelessWidget {
  const InstagramFormField({
    super.key,
    required this.instagramHandleController,
  });

  final TextEditingController instagramHandleController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(LineIcons.instagram),
        SizedBox(width: 12.0),
        SizedBox(
          width: MediaQuery.of(context).size.width * .6,
          child: TextField(
            controller: instagramHandleController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(2.0),
                hintText: 'Instagram handle',
                labelStyle: TextStyle(
                  fontSize: 13.0,
                )),
          ),
        ),
      ],
    );
  }
}

class FacebookHandleFormField extends StatelessWidget {
  const FacebookHandleFormField({
    super.key,
    required this.fbHandleController,
  });

  final TextEditingController fbHandleController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(LineIcons.facebook),
        SizedBox(width: 12.0),
        SizedBox(
          width: MediaQuery.of(context).size.width * .6,
          child: TextField(
            controller: fbHandleController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(2.0),
                hintText: 'Facebook handle',
                labelStyle: TextStyle(
                  fontSize: 13.0,
                )),
          ),
        ),
      ],
    );
  }
}

class WorkAddressFormField extends StatelessWidget {
  const WorkAddressFormField({
    super.key,
    required this.workAddressController,
  });

  final TextEditingController workAddressController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(LineIcons.building),
        SizedBox(width: 12.0),
        SizedBox(
          width: MediaQuery.of(context).size.width * .6,
          child: TextField(
            controller: workAddressController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(2.0),
                hintText: 'Work address',
                labelStyle: TextStyle(
                  fontSize: 13.0,
                )),
          ),
        ),
      ],
    );
  }
}

class HomeAddressFormField extends StatelessWidget {
  const HomeAddressFormField({
    super.key,
    required this.homeAddressController,
  });

  final TextEditingController homeAddressController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(LineIcons.home),
        SizedBox(width: 12.0),
        SizedBox(
          width: MediaQuery.of(context).size.width * .6,
          child: TextField(
            controller: homeAddressController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(2.0),
                hintText: 'Home address',
                labelStyle: TextStyle(
                  fontSize: 13.0,
                )),
          ),
        ),
      ],
    );
  }
}

class MobileNoFormField extends StatelessWidget {
  const MobileNoFormField({
    super.key,
    required this.mobileNumberController,
  });

  final TextEditingController mobileNumberController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(LineIcons.mobilePhone),
        SizedBox(width: 12.0),
        SizedBox(
          width: MediaQuery.of(context).size.width * .6,
          child: TextField(
            controller: mobileNumberController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(2.0),
                hintText: 'Mobile no.',
                labelStyle: TextStyle(
                  fontSize: 13.0,
                )),
          ),
        ),
      ],
    );
  }
}

class UsernameFormField extends StatelessWidget {
  const UsernameFormField({
    super.key,
    required this.usernameController,
  });

  final TextEditingController usernameController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(LineIcons.user),
        SizedBox(width: 12.0),
        SizedBox(
          width: MediaQuery.of(context).size.width * .6,
          child: TextField(
            controller: usernameController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(2.0),
                hintText: 'Username',
                labelStyle: TextStyle(
                  fontSize: 13.0,
                )),
          ),
        ),
      ],
    );
  }
}

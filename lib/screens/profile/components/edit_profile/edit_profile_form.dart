import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/utils/constants/colors.dart';


class EditProfileForm extends StatelessWidget {
  const EditProfileForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. username
          UsernameFormField(),
          // 2. mobile no.
          MobileNoFormField(),
          // 3. home address
          HomeAddressFormField(),
          // 4. work address
          WorkAddressFormField(),
          // 5. facebook handle
          FacebookHandleFormField(),
          // 6. instagram handle
          InstagramFormField(),
          // 7. X(formerly twitter) handle
          TwitterFormField(),
          SizedBox(height: 16.0),
          // 8. Bio
          UserBioFormField(),
          SizedBox(height: 12.0),   // add spacing between the last input field and the button
          UpdateProfileBtn(),
        ],
      ),
    );
  }
}

class UpdateProfileBtn extends StatelessWidget {
  const UpdateProfileBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28.0,
      width: MediaQuery.of(context).size.width * .64,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(kPrimaryColor),
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 2.0)),
          shape: WidgetStatePropertyAll(BeveledRectangleBorder(borderRadius: BorderRadius.circular(2.0))),
        ),
        onPressed: () {},
        child: Text('Update profile', style: TextStyle(color: kTextLightColor)),
      ),
    );
  }
}

class UserBioFormField extends StatelessWidget {
  const UserBioFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(LineIcons.user),
        SizedBox(width: 12.0),
        SizedBox(
          width: MediaQuery.of(context).size.width * .6,
          child: TextField(
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
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(LineIcons.twitter),
        SizedBox(width: 12.0),
        SizedBox(
          width: MediaQuery.of(context).size.width * .6,
          child: TextField(
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
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(LineIcons.instagram),
        SizedBox(width: 12.0),
        SizedBox(
          width: MediaQuery.of(context).size.width * .6,
          child: TextField(
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
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(LineIcons.facebook),
        SizedBox(width: 12.0),
        SizedBox(
          width: MediaQuery.of(context).size.width * .6,
          child: TextField(
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
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(LineIcons.building),
        SizedBox(width: 12.0),
        SizedBox(
          width: MediaQuery.of(context).size.width * .6,
          child: TextField(
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
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(LineIcons.home),
        SizedBox(width: 12.0),
        SizedBox(
          width: MediaQuery.of(context).size.width * .6,
          child: TextField(
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
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(LineIcons.mobilePhone),
        SizedBox(width: 12.0),
        SizedBox(
          width: MediaQuery.of(context).size.width * .6,
          child: TextField(
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
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(LineIcons.user),
        SizedBox(width: 12.0),
        SizedBox(
          width: MediaQuery.of(context).size.width * .6,
          child: TextField(
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

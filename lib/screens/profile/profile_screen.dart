import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/screens/profile/components/profile_screen/profile_screen_body.dart';
import 'package:ride_share/utils/constants/colors.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ProfileScreenBody(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          LineIcons.userEdit,
          color: kIconLightColor,
        ),
      ),
    );
  }
}

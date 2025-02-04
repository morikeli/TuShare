import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/screens/profile/edit_profile_screen.dart';
import 'package:ride_share/utils/constants/colors.dart';

class EmbeddedIcons extends StatelessWidget {
  const EmbeddedIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            tooltip: 'Edit profile',
            onPressed: () => Get.to(
              () => EditProfileScreen(),
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 1500)
            ),
            icon: Icon(
              LineIcons.userEdit,
              color: kIconLightColor,
            ),
          )
        ],
      ),
    );
  }
}

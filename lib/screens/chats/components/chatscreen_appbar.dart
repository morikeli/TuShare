import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share/screens/chats/group_members_screen.dart';
import 'package:ride_share/utils/constants/api_endpoints.dart';
import 'package:ride_share/utils/constants/colors.dart';

AppBar chatScreenAppBar(
  BuildContext context,
  String driverName,
  String driverProfilePic,
) {
  return AppBar(
    title: GestureDetector(
      onTap: () {
        Get.to(
          duration: Duration(milliseconds: 1500),
          transition: Transition.rightToLeftWithFade,
          () => GroupMembersScreen(
            driverName: driverName,
            driverProfilePic: driverProfilePic,
          ),
        );
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 16.0,
            backgroundImage: NetworkImage(
              '${ApiConstants.mediaURL}/$driverProfilePic',
            ),
          ),
          SizedBox(width: 8.0),
          Text(
            driverName,
            style: TextStyle(
              color: kTextLightColor,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
    actions: [],
  );
}

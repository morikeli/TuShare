import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/common/widgets/icon_badge.dart';


AppBar sharedAppBar(BuildContext context, String title, IconData? titleIcon) {
  return AppBar(
    automaticallyImplyLeading: false,   // hides back button when homescreen is loading
    centerTitle: true,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(titleIcon),
        SizedBox(width: 5.0),
        Text(title, style: Theme.of(context).textTheme.titleLarge),
      ],
    ),
    actions: [
      IconButton(
        tooltip: 'Notifications',
        onPressed: () {},
        icon: Stack(
          children: [Icon(LineIcons.bell), IconBadge()],
        ),
      ),
      IconButton(
        tooltip: 'Change theme',
        onPressed: () {
          if (Get.isDarkMode) {
            Get.changeThemeMode(ThemeMode.light);
          } else {
            Get.changeThemeMode(ThemeMode.dark);
          }
        },
        icon: Icon(Get.isDarkMode ? LineIcons.moon : LineIcons.sun),
      ),
    ],
  );
}

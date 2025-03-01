import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/controllers/auth_controller.dart';
import 'package:ride_share/utils/constants/colors.dart';


class EmbeddedIcons extends StatelessWidget {
  EmbeddedIcons({
    super.key,
  });

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == 'edit_profile') {
                Get.toNamed('/edit-profile');   // Navigate to Edit Profile screen
              } else if (value == 'change_theme') {
                if (Get.isDarkMode) {
                  Get.changeThemeMode(ThemeMode.light);
                } else {
                  Get.changeThemeMode(ThemeMode.dark);
                }
              } else if (value == 'logout') {
                authController.logout();
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 'edit_profile',
                child: ListTile(
                  leading: const Icon(LineIcons.userEdit),
                  title: const Text('Edit Profile'),
                ),
              ),
              PopupMenuItem(
                value: 'change_theme',
                child: ListTile(
                  leading: Icon(Get.isDarkMode ? LineIcons.moon : LineIcons.sun),
                  title: const Text('Change Theme'),
                ),
              ),
              PopupMenuItem(
                value: 'logout',
                child: ListTile(
                  leading: const Icon(LineIcons.doorOpen, color: kDangerColor),
                  title: const Text('Logout', style: TextStyle(color: kDangerColor)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

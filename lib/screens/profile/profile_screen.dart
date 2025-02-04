import 'package:flutter/material.dart';
import 'package:ride_share/screens/profile/components/profile_screen/profile_screen_body.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ProfileScreenBody(),
    );
  }
}

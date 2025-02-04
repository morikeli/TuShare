import 'package:flutter/material.dart';
import 'package:ride_share/screens/profile/components/edit_profile/edit_profile_screen_body.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit profile'),
        centerTitle: true,
      ),
      body: EditProfileScreenBody(),
    );
  }
}

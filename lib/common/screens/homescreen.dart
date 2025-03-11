import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/screens/home/home.dart';
import 'package:ride_share/screens/messages/messages_screen.dart';
import 'package:ride_share/screens/profile/profile_screen.dart';
import 'package:ride_share/utils/constants/colors.dart';
import 'package:ride_share/widgets/custom_bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screenIndex = 0;
  final List<Widget> screens = [
    Home(),
    MessagesScreen(),
    ProfileScreen(),
  ];

  void moveToSelectedScreen(int index) {
    setState(() {
      screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[screenIndex],
      bottomNavigationBar: CustomBottomNavBar(
        onTabClicked: (index) => moveToSelectedScreen(index),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          LineIcons.shareSquareAlt,
          color: kIconLightColor,
        ),
      ),
    );
  }
}

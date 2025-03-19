import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/utils/constants/colors.dart';


class CustomBottomNavBar extends StatelessWidget {
  final void Function(int) onTabClicked;
  const CustomBottomNavBar({
    super.key,
    required this.onTabClicked,
  });

  @override
  Widget build(BuildContext context) {
    return GNav(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      onTabChange: onTabClicked,
      rippleColor: Colors.grey, // tab button ripple color when pressed
      hoverColor: Colors.white38, // tab button hover color
      duration: Duration(milliseconds: 300), // tab animation duration
      gap: 8, // the tab button gap between icon and text
      color: Colors.grey, // unselected icon color
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0), // navigation bar padding
      textStyle: Theme.of(context).textTheme.titleSmall,
      tabs: [
        GButton(
          icon: LineIcons.home,
          text: 'Home',
          // textColor: kTextLightColor,
        ),
        GButton(
          icon: LineIcons.commentsAlt,
          text: 'Messages',
          textColor: kTextLightColor,
        ),
        GButton(
          icon: LineIcons.user,
          text: 'Profile',
          textColor: kTextLightColor,
        ),
      ],
    );
  }
}

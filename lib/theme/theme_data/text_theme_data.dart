// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:ride_share/utils/constants/colors.dart';


class GoRideAppTextTheme {
  GoRideAppTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    // headlines
    
    headlineLarge: const TextStyle().copyWith(color: kTextLightColor, fontSize: 24.0, fontFamily: 'Nunito', fontWeight: FontWeight.bold),
    headlineMedium: const TextStyle().copyWith(color: kTextDarkColor, fontSize: 16.0, fontFamily: 'Nunito', fontWeight: FontWeight.w400),
    headlineSmall: const TextStyle().copyWith(color: kTextDarkColor, fontSize: 14.0, fontFamily: 'Nunito'),

    // titles
    /*
      titleLarge - used in Tab() in TabBar()
      titleMedium - used in: 
        1. HomeScreeCards() to display driver's name
        2. Tab() in TabBar() to display tab name
        3. ChatScreen() to display the recipient's name
      titleSmall - used in GNav() in CustomBottomNavBar()
    */
    titleLarge: const TextStyle().copyWith(color: kTextLightColor, fontSize: 20.0, fontFamily: 'Nunito', fontWeight: FontWeight.bold),
    titleMedium: const TextStyle().copyWith(color: kTextDarkColor, fontSize: 16.0, fontFamily: 'Nunito', fontWeight: FontWeight.bold),
    titleSmall: const TextStyle().copyWith(color: kTextDarkColor, fontSize: 13.0, fontFamily: 'Nunito'),

    // body text
    /*
      These are used in the body sections of the app      
    */
    bodyLarge: const TextStyle().copyWith(color: kTextDarkColor, fontSize: 16.0, fontFamily: 'Nunito', fontWeight: FontWeight.bold),
    bodyMedium: const TextStyle().copyWith(color: kTextDarkColor, fontSize: 14.0, fontFamily: 'Nunito', fontWeight: FontWeight.w400),
    bodySmall: const TextStyle().copyWith(color: kTextDarkColor.withOpacity(.5), fontSize: 13.0, fontFamily: 'Nunito', fontWeight: FontWeight.w500),

    // labels
    /*
      labelMedium - used in ChatAndCallContainer()
      labelSmall - used in HomeScreenCards()
    */
    labelLarge: const TextStyle().copyWith(color: kTextDarkColor, fontSize: 16.0, fontFamily: 'Nunito', fontWeight: FontWeight.bold),
    labelMedium: const TextStyle().copyWith(color: kTextDarkColor, fontSize: 14.0, fontFamily: 'Nunito', fontWeight: FontWeight.w400),
    labelSmall: const TextStyle().copyWith(color: kLabelSmallColor, fontSize: 12.0, fontFamily: 'Nunito'),
  );

  // Dark theme text
  static TextTheme darkTextTheme = TextTheme(
    // headlines
    headlineLarge: const TextStyle().copyWith(color: kTextLightColor, fontSize: 24.0, fontFamily: 'Nunito', fontWeight: FontWeight.bold),
    headlineMedium: const TextStyle().copyWith(color: kTextDarkColor, fontSize: 16.0, fontFamily: 'Nunito', fontWeight: FontWeight.w400),
    headlineSmall: const TextStyle().copyWith(color: kTextLightColor, fontSize: 14.0, fontFamily: 'Nunito',),

    // titles
    /*
      titleLarge - used in Tab() in TabBar()
      titleMedium - used in: 
        1. HomeScreeCards() to display driver's name
        2. Tab() in TabBar() to display tab name
        3. ChatScreen() to display the recipient's name
      titleSmall - used in GNav() in CustomBottomNavBar()
    */
    titleLarge: const TextStyle().copyWith(color: kTextLightColor, fontSize: 20.0, fontFamily: 'Nunito', fontWeight: FontWeight.bold),
    titleMedium: const TextStyle().copyWith(color: kTextLightColor, fontSize: 16.0, fontFamily: 'Nunito', fontWeight: FontWeight.bold),
    titleSmall: const TextStyle().copyWith(color: kTextLightColor, fontSize: 13.0, fontFamily: 'Nunito'),

    // body text
    /*
      These are used in the body sections of the app
    */
    bodyLarge: const TextStyle().copyWith(color: kTextLightColor, fontSize: 16.0, fontFamily: 'Nunito', fontWeight: FontWeight.bold),
    bodyMedium: const TextStyle().copyWith(color: kTextLightColor, fontSize: 14.0, fontFamily: 'Nunito', fontWeight: FontWeight.w400),
    bodySmall: const TextStyle().copyWith(color: kTextLightColor.withOpacity(.5), fontSize: 13.0, fontFamily: 'Nunito', fontWeight: FontWeight.w500),
    
    // labels
    /*
      labelMedium - used in ChatAndCallContainer()
      labelSmall - used in HomeScreenCards()
    */
    labelLarge: const TextStyle().copyWith(color: kTextLightColor, fontSize: 16.0, fontFamily: 'Nunito', fontWeight: FontWeight.bold),
    labelMedium: const TextStyle().copyWith(color: kTextLightColor, fontSize: 14.0, fontFamily: 'Nunito', fontWeight: FontWeight.w400),
    labelSmall: const TextStyle().copyWith(color: kLabelSmallColor, fontSize: 12.0, fontFamily: 'Nunito'),
  );

}
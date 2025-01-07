import 'package:flutter/material.dart';
import 'package:ride_share/theme/theme_data/appbar_theme_data.dart';
import 'package:ride_share/theme/theme_data/tabbar_theme.dart';
import 'package:ride_share/theme/theme_data/text_theme_data.dart';
import 'package:ride_share/utils/constants/colors.dart';


class GoRideAppTheme {
  GoRideAppTheme._();

  static ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    appBarTheme: GoRideAppbarTheme.appBarLightTheme,
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      secondaryContainer: Colors.white,
    ),
    cardColor: kCardLightColor,
    dividerColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: kTextLightColor, fontFamily: 'Nunito', fontSize: 12.0),
    ),
    scaffoldBackgroundColor: kScaffoldBgColor,
    tabBarTheme: GoRideAppTabBarTheme.tabBarLightTheme,
    textTheme: GoRideAppTextTheme.lightTextTheme,

  );

  static ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    appBarTheme: GoRideAppbarTheme.appBarDarkTheme,
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      secondaryContainer: kSecondaryColor,
    ),
    cardColor: kCardDarkColor,
    dividerColor: Colors.black,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: kTextDarkColor, fontFamily: 'Nunito-Light', fontSize: 12.0),
    ),
    scaffoldBackgroundColor: kScaffoldDarkBgColor,
    tabBarTheme: GoRideAppTabBarTheme.tabBarDarkTheme,
    textTheme: GoRideAppTextTheme.darkTextTheme,
  );
}
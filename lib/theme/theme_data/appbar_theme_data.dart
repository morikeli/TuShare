import 'package:flutter/material.dart';
import 'package:ride_share/theme/theme_data/text_theme_data.dart';
import 'package:ride_share/utils/constants/colors.dart';

class GoRideAppbarTheme {
  GoRideAppbarTheme._();

  static AppBarTheme appBarLightTheme = AppBarTheme().copyWith(
    backgroundColor: Colors.blue,
    elevation: 0,
    iconTheme: IconThemeData(color: kIconLightColor),
    titleTextStyle: GoRideAppTextTheme.lightTextTheme.titleLarge,
  );

  static AppBarTheme appBarDarkTheme = AppBarTheme().copyWith(
    backgroundColor: Colors.blue.shade800,
    elevation: 0,
    iconTheme: IconThemeData(color: kIconLightColor),
    titleTextStyle: GoRideAppTextTheme.lightTextTheme.titleLarge,
  );
}

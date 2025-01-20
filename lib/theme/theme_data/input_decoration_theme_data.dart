import 'package:flutter/material.dart';
import 'package:ride_share/utils/constants/colors.dart';


class TuShareAppInputDecorationTheme {
  TuShareAppInputDecorationTheme._();

  static InputDecorationTheme inputDecorationLightTheme = InputDecorationTheme(
    fillColor: Colors.grey.shade300,
    hintStyle: TextStyle(color: kTextDarkColor, fontFamily: 'Nunito', fontSize: 12.0),
  );

  static InputDecorationTheme inputDecorationDarkTheme = InputDecorationTheme(
    fillColor: Colors.grey.shade900,
    hintStyle: TextStyle(color: kTextLightColor, fontFamily: 'Nunito', fontSize: 12.0),
  );
}
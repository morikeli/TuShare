import 'package:flutter/material.dart';
import 'package:ride_share/utils/constants/colors.dart';


class TuShareAppInputDecorationTheme {
  TuShareAppInputDecorationTheme._();

  static InputDecorationTheme inputDecorationLightTheme = InputDecorationTheme(
    contentPadding: EdgeInsets.all(2.0),
    fillColor: Colors.grey.shade300,
    hintStyle: TextStyle(color: kTextDarkColor, fontFamily: 'Nunito', fontSize: 12.0),
    labelStyle: TextStyle(fontSize: 13.0),

  );

  static InputDecorationTheme inputDecorationDarkTheme = InputDecorationTheme(
    contentPadding: EdgeInsets.all(2.0),
    fillColor: Colors.grey.shade900,
    hintStyle: TextStyle(color: kTextSecondaryColor, fontFamily: 'Nunito', fontSize: 12.0),
    labelStyle: TextStyle(fontSize: 13.0),
  );
}
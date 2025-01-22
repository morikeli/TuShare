import 'package:flutter/material.dart';
import 'package:ride_share/utils/constants/colors.dart';

class TuShareAppColorScheme {
  TuShareAppColorScheme._();

  static ColorScheme colorSchemeLight = ColorScheme.light(
    brightness: Brightness.light,
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
    secondaryContainer: Colors.white,
  );
  
  static ColorScheme colorSchemeDark = ColorScheme.dark(
    brightness: Brightness.dark,
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
    secondaryContainer: kSecondaryColor,
  );
}
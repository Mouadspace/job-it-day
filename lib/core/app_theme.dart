import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_style.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    // FONT FAMILY
    fontFamily: 'Inter',

    // TEXT THEME
    textTheme: const TextTheme(
      titleLarge: h2Style,
      titleMedium: h3Style,
      labelLarge: h4Style,
      labelSmall: h5Style,
      labelMedium: h6Style,
    ),

    // COLORS
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
      primary: LightThemeColor.primaryColor,
      secondary: LightThemeColor.secondaryColor,
    ),
  );
}

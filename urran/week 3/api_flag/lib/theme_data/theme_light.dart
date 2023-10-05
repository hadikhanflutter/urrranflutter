import 'package:api_flag/theme_data/theme_colors.dart';
import 'package:api_flag/theme_data/theme_text.dart';
import 'package:flutter/material.dart';

class ThemeLight {
  ThemeLight._();
  static ThemeData light_theme = ThemeData(
    backgroundColor: ThemeColors.backgroundColor_lt,
    appBarTheme: appBarTheme,
    textTheme: ThemeText.text_Theme_lt,
  );

  static AppBarTheme appBarTheme = AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 30,
    ),
    backgroundColor: ThemeColors.appbar_backgroundColor_lt,
  );

  static IconThemeData icon_theme_data = IconThemeData(
    color: Colors.black54,
    size: 100,
  );
}

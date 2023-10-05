import 'package:api_flag/theme_data/theme_colors.dart';
import 'package:api_flag/theme_data/theme_text.dart';
import 'package:flutter/material.dart';

class ThemeDark {
  ThemeDark._();

  static ThemeData dark_theme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.lightBlue,
    appBarTheme: appBarTheme,
    textTheme: ThemeText.text_Theme_dt,
  );
  static AppBarTheme appBarTheme = AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 50,
    ),
    backgroundColor: ThemeColors.appbar_backgroundColor_dt,
  );

  static IconThemeData icon_theme_data = IconThemeData(
    color: Colors.white,
    size: 120,
  );
}

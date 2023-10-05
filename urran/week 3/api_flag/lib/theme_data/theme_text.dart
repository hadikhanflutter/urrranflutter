import 'package:flutter/material.dart';

class ThemeText {
  ThemeText._();

  static TextTheme text_Theme_lt = TextTheme(
      displayLarge: TextStyle(
    fontSize: 60,
    fontStyle: FontStyle.italic,
    color: Colors.blue,
    fontWeight: FontWeight.bold,
  ));

  static TextTheme text_Theme_dt = TextTheme(
      headline1: TextStyle(
    fontStyle: FontStyle.normal,
    fontSize: 60,
    color: Colors.white,
  ));
}

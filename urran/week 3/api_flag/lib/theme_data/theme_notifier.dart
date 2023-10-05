import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  bool is_home_screen = false;

  bool get getScreenStatus {
    return is_home_screen;
  }

  void SetThemeStatus(bool isHomeScreen) async {
    is_home_screen = isHomeScreen;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_home_screen', isHomeScreen);
    notifyListeners();
  }
}

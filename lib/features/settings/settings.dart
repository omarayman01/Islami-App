import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String language = 'en';
  String get bckGround => themeMode == ThemeMode.light
      ? 'assets/images/default_bg.png'
      : 'assets/images/dark_bg.png';
  String get sebhaGround => themeMode == ThemeMode.light
      ? 'assets/images/body_sebha_logo.png'
      : 'assets/images/body_sebha_dark.png';
  String get sebha2Ground => themeMode == ThemeMode.light
      ? 'assets/images/head_sebha_logo.png'
      : 'assets/images/head_sebha_dark.png';

  Color get groundColor =>
      themeMode == ThemeMode.light ? AppTheme.white : AppTheme.primaryDark;
  Color get ground2Color => themeMode == ThemeMode.light
      ? AppTheme.primarylight
      : AppTheme.primaryDark;
  Color get sebhagroundColor =>
      themeMode == ThemeMode.light ? AppTheme.primarylight : AppTheme.gold;
  void changeTheme(ThemeMode selectedTheme) {
    themeMode = selectedTheme;
    notifyListeners();
  }

  void changeLanguage(String selectedLanguage) {
    if (selectedLanguage == language) return;
    language = selectedLanguage;
    notifyListeners();
  }
}

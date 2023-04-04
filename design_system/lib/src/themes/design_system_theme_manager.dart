import 'package:flutter/material.dart';

class DesignSystemThemeManager with ChangeNotifier {
  static ThemeMode _themeMode = ThemeMode.light;

  static ThemeMode get themeMode => _themeMode;

  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  static bool isDark() => themeMode == ThemeMode.dark;
}

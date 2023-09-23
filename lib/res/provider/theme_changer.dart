import 'package:flutter/material.dart';

class ThemeChanger extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  String _modeName = 'Light Mode';
  String get modeName => _modeName;

  bool _value = true;
  bool get value => _value;

  void setTheme(themeMode, String modeName) {
    _themeMode = themeMode;
    _modeName = modeName;

    notifyListeners();
  }

  void raioThemeChanger(ThemeMode? themeMode, String val) {
    _themeMode = themeMode!;
    _modeName = val;
    notifyListeners();
  }

  void switchThemeChanger(themeMode, val, String modeName) {
    _themeMode = themeMode;
    _value = val;
    _modeName = modeName;
    notifyListeners();
  }
}

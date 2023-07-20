import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier {
  late bool _isDark;
  bool get isDark => _isDark;

  ThemeManager() {
    _isDark = false;
  }

  set isDark(bool value) {
    _isDark = value;
    notifyListeners();
  }
}

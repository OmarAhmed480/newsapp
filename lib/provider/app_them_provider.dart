import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.light;

  bool isDark() {
    return appTheme == ThemeMode.dark;
  }

  Future<void> changThem(ThemeMode newTheme) async {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'theme',
      newTheme == ThemeMode.dark ? "dark" : "light",
    );
    notifyListeners();
  }

 Future<void> loadThem() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var theme = await prefs.getString('theme');
    if (theme == "dark") {
      appTheme = ThemeMode.dark;
    } else if (theme == "light") {
      appTheme = ThemeMode.light;
    }

    notifyListeners();
  }
}

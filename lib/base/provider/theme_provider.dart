import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp/theme.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _selectedTheme;
  late SharedPreferences prefs;
  ThemeProvider({bool isDark = false}) {
    _selectedTheme = isDark ? dark : light;
  }

  ThemeData get getTheme => _selectedTheme;

  Future<void> changeTheme() async {
    prefs = await SharedPreferences.getInstance();

    if (_selectedTheme == dark) {
      _selectedTheme = light;
      await prefs.setBool("isDark", false);
    } else {
      _selectedTheme = dark;
      await prefs.setBool("isDark", true);
    }
    notifyListeners();
  }
}

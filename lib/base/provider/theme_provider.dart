import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp/theme.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData selectedTheme;
  late SharedPreferences prefs;
  ThemeProvider({bool isDark = false}) {
    selectedTheme = isDark ? dark : light;
  }

  ThemeData get getTheme => selectedTheme;

  Future<void> changeTheme() async {
    prefs = await SharedPreferences.getInstance();

    if (selectedTheme == dark) {
      selectedTheme = light;
      await prefs.setBool("isDark", false);
    } else {
      selectedTheme = dark;
      await prefs.setBool("isDark", true);
    }
    notifyListeners();
  }
}

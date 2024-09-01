import 'package:flutter/material.dart';

final ThemeData light = ThemeData(
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF00856e),
        onPrimary: Color.fromARGB(255, 164, 225, 255),
        secondary: Color.fromARGB(255, 192, 234, 144),
        onSecondary: Color.fromARGB(255, 164, 225, 255),
        error: Colors.red,
        onError: Color(0XFFDFD4C7),
        surface: Colors.white,
        onSurface: Colors.black),
    iconTheme: const IconThemeData(color: Colors.white));

final ThemeData dark = ThemeData(
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF00856e),
        onPrimary: Color.fromARGB(255, 164, 225, 255),
        secondary: Color(0xFF00856e),
        onSecondary: Color.fromARGB(255, 5, 65, 95),
        error: Colors.red,
        onError: Color(0XFFDFD4C7),
        surface: Colors.black,
        onSurface: Colors.white),
    iconTheme: const IconThemeData(color: Colors.white));

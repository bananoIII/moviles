import 'package:flutter/material.dart';

class ThemeSettings {
  static ThemeData lightTheme() {
    final theme = ThemeData.light().copyWith(
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Colors.white,
        onPrimary: Colors.red,
        secondary: Colors.redAccent,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: Colors.white,
        onBackground: Colors.black87,
        surface: Colors.grey,
        onSurface: Colors.black87,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
    );
    return theme;
  }

  static ThemeData darkTheme() {
    final theme = ThemeData.dark().copyWith(
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.black,
        onPrimary: Colors.lime,
        secondary: Colors.limeAccent,
        onSecondary: Colors.black,
        error: Colors.redAccent,
        onError: Colors.black,
        background: Colors.black,
        onBackground: Colors.limeAccent,
        surface: Colors.grey,
        onSurface: Colors.limeAccent,
      ),
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.limeAccent,
      ),
    );
    return theme;
  }
}

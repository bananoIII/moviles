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

  static ThemeData p3lightTheme() {
    final theme = ThemeData.light().copyWith(
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF007BFF), // Azul principal (botones, iconos)
        onPrimary: Colors.white, // Texto sobre botones primarios
        secondary: Color(0xFFCCE6FF), // Azul claro (fondos suaves, tarjetas)
        onSecondary: Colors.black, // Texto sobre secundarios
        error: Colors.redAccent,
        onError: Colors.white,
        surface: Color(0xFFF2F9FF), // Fondo general claro
        onSurface: Colors.black87,
      ),
      scaffoldBackgroundColor: Color(0xFFF2F9FF),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xFF007BFF),
        elevation: 0,
      ),
    );
    return theme;
  }
}

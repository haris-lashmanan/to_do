import 'package:flutter/material.dart';

class AppThemes {
  static const Color primaryBlue = Color(0xFF0052CC);
  static const Color secondaryOrange = Color(0xFFFF8B00);
  static const Color grey = Colors.grey;
  static const Color black12 = Colors.black12;
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color blue = Colors.blue;
  static const Color green = Colors.green;
  static const Color orange = Colors.orange;

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryBlue,
      primary: primaryBlue,
      secondary: secondaryOrange,
      surface: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryBlue,
      foregroundColor: Colors.white,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryBlue,
      brightness: Brightness.dark,
    ),
  );
}

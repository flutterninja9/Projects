import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData primaryTheme = ThemeData(
    primaryColor: Color.fromRGBO(18, 18, 18, 1),
    canvasColor: Colors.white,
    accentColor: Colors.grey[800],
  );
  static ThemeData primaryDarkTheme = ThemeData(
    primaryColor: Colors.white,
    canvasColor: Color.fromRGBO(18, 18, 18, 1),
    accentColor: Colors.grey[800],
  );
}

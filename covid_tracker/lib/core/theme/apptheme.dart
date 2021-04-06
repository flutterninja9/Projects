import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class AppTheme {
  static ThemeData primaryTheme = ThemeData(
    primarySwatch: Colors.blue,
  );

  static ThemeData primaryDark = ThemeData(
    canvasColor: const Color.fromRGBO(18, 18, 18, 1),
    cardColor: const Color.fromRGBO(26, 26, 26, 1),
    primaryColor: const Color.fromRGBO(31, 31, 31, 1),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: Colors.white,
      ),
      subtitle1: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 13,
        color: Colors.white,
      ),
      headline2: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: Colors.white,
      ),
    ),
  );
}

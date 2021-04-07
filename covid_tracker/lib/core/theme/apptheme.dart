import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class AppTheme {
  static ThemeData primaryTheme = ThemeData(
    canvasColor: const Color.fromRGBO(242, 242, 242, 1),
    cardColor: const Color.fromRGBO(232, 232, 232, 1),
    primaryColor: const Color.fromRGBO(50, 184, 191, 1),
    primaryColorDark: Colors.black,
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: Color.fromRGBO(20, 20, 20, 1),
      ),
      subtitle1: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 13,
        color: Color.fromRGBO(20, 20, 20, 1),
      ),
      headline2: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: Color.fromRGBO(20, 20, 20, 1),
      ),
    ),
  );

  static ThemeData primaryDark = ThemeData(
    canvasColor: const Color.fromRGBO(18, 18, 18, 1),
    cardColor: const Color.fromRGBO(26, 26, 26, 1),
    primaryColor: const Color.fromRGBO(31, 31, 31, 1),
    primaryColorDark: Colors.white,
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

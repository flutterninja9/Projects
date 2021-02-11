import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/utils/app_theme.dart';
import 'views/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cool Wallpaper App',
      theme: AppTheme.primaryTheme,
      darkTheme: AppTheme.primaryDarkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

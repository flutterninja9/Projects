import 'package:flutter/material.dart';
import 'package:weather_app/views/home.dart';
import 'package:get/get.dart';
import 'package:weather_app/views/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.cupertino,
      theme: ThemeData(
        accentColor: Colors.orange,
        primaryColor: Colors.orange
      ),
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}

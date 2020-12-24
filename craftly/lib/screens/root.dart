import 'package:craftly/controllers/authController.dart';
import 'package:craftly/controllers/cartController.dart';
import 'package:craftly/controllers/productController.dart';
import 'package:craftly/controllers/uiController.dart';
import 'package:craftly/screens/home.dart';
import 'package:craftly/screens/introScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Root extends GetWidget<AuthController> {
  AuthController controller = Get.put(AuthController());
  UIController uiController = Get.put(UIController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.logged_in == "true") {
        return HomeScreen();
      } else {
        return IntroScreen();
      }
    });
  }
}

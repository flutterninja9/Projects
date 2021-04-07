import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var _isDark = false.obs;

  // For dynamic theming support
  void changeTheme() {
    _isDark.value
        ? Get.changeThemeMode(ThemeMode.light)
        : Get.changeThemeMode(ThemeMode.dark);
    _isDark.value = !_isDark.value;
    print('Done');
  }

  @override
  void onInit() {
    _isDark.value = Get.isDarkMode;
    super.onInit();
  }
}

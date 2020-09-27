import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  TextEditingController postText;

  @override
  void onInit() {
    postText = TextEditingController();
    super.onInit();

  }

  @override
  void disposeId(String id) {
    // TODO: implement disposeId
    super.disposeId(id);
    postText.dispose();
  }


}

class ContentController extends GetxController {
  FontWeight defaultWeight = FontWeight.w600;
  Color primaryColor = Colors.white;
  double fontSize=30;
}
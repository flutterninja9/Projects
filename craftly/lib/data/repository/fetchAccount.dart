import 'dart:convert';
import 'package:get/get.dart' as getC;
import 'package:craftly/controllers/authController.dart';
import 'package:craftly/helpers/urls.dart';
import 'package:http/http.dart';

Future<Map<String, dynamic>> accountDetails() async {
  AuthController authController = getC.Get.find();
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': "Token " + authController.token.value
  };
  try {
    Response response = await get(accountURL, headers: headers);
    Map<String, dynamic> rawAccountInfo = jsonDecode(response.body);
    return rawAccountInfo;
  } catch (e) {
    print(e);
  }
}

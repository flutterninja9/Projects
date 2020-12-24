import 'dart:convert';
import 'package:craftly/controllers/authController.dart';
import 'package:craftly/helpers/urls.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getWishListedItems() async {
  AuthController controller = Get.find();
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Token ' + controller.token.value
  };
  http.Response response = await http.get(getWishListURL, headers: headers);
  Map<String, dynamic> result = jsonDecode(response.body);
  return result;
}

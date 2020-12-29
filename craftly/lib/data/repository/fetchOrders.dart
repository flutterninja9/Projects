import 'dart:convert';

import 'package:craftly/controllers/authController.dart';
import 'package:craftly/helpers/urls.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<List> fetchOrders() async {
  AuthController controller = Get.find();
  Map<String, String> headers = {
    'Content-Types': 'application/json',
    'Authorization': 'Token ${controller.token.value}'
  };
  http.Response response = await http.get(getOrdersURL, headers: headers);
  List result = jsonDecode(response.body);
  return result;
}

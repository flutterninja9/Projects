import 'dart:convert';

import 'package:craftly/controllers/authController.dart';
import 'package:craftly/helpers/urls.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<List> fetchAddress() async {
  AuthController controller = Get.find();
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Token ' + controller.token.value
  };
  try {
    http.Response response = await http.get(getAddressURL, headers: headers);
    List rawAddresses = jsonDecode(response.body);
    return jsonDecode(response.body);
  } catch (e) {
    print(e);
  }
}

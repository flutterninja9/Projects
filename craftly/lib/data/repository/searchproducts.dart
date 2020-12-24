import 'dart:convert';
import 'package:craftly/helpers/urls.dart';
import 'package:http/http.dart';

searchProducts({String query}) async {
  try {
    Response response = await get(searchURL + query);
    List result = jsonDecode(response.body);
    return result;
  } catch (e) {
    print(e);
  }
}

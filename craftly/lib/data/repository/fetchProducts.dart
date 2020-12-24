import 'dart:convert';
import 'package:craftly/helpers/urls.dart';
import 'package:http/http.dart';

fetchProducts() async {
  try {
    Response response = await get(allProducts);
    List result = jsonDecode(response.body);
    return result;
  } catch (e) {
    print(e);
  }
}

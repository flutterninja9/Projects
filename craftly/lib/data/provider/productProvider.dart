import 'dart:convert';

import 'package:craftly/data/models/productModel.dart';
import 'package:craftly/data/repository/fetchProducts.dart';

Future<List<Product>> getProducts() async {
  List rawProducts = await fetchProducts();
  List<Product> products = [];
  rawProducts
      .map((product) => products.add(Product.fromJson(product)))
      .toList();
  return products;
}

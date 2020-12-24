import 'package:craftly/data/models/productModel.dart';
import 'package:craftly/data/repository/searchproducts.dart';

Future<List<Product>> getSearchedProducts({String searchFor}) async {
  List rawProducts = await searchProducts(query: searchFor);
  List<Product> products = [];
  rawProducts
      .map((product) => products.add(Product.fromJson(product)))
      .toList();
  return products;
}

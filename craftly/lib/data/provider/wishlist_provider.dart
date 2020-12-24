import 'package:craftly/controllers/cartController.dart';
import 'package:craftly/data/models/productModel.dart';
import 'package:craftly/data/repository/fetchWishList.dart';
import 'package:get/get.dart';

Future<List<Product>> getWishList() async {
  CartController cartController = Get.find();
  Map<String, dynamic> wTemp = await getWishListedItems();
  List<Product> products = [];
  wTemp["you wishlist"].map((value) {
    products.add(cartController.tempWholeMap[value["item"]]);
  }).toList();
  return products;
}

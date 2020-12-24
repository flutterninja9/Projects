import 'dart:convert';

import 'package:craftly/controllers/authController.dart';
import 'package:craftly/controllers/productController.dart';
import 'package:craftly/data/models/productModel.dart';
import 'package:craftly/helpers/urls.dart';
import 'package:craftly/screens/orderSuccess.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  // Just getting a map for image reference
  var imageMap = {}.obs;

  // Just getting a map for name reference
  var nameMap = {}.obs;

  // Just getting a map for whole
  var tempWholeMap = {}.obs;

  // For getting selected size of product
  ProductController productController = Get.find();

  // For getting token reference
  AuthController controller = Get.find();

  // Getting the no. of items in cart
  Rx<int> cartCount = Rx<int>();

  // The total current cart price
  Rx<dynamic> cartAmount = Rx<dynamic>();

  //For storing raw cart data

  Rx<List> cartItems = Rx<List>();

  // Setter for image map
  setImageMap({List<Product> prodList}) async {
    prodList.map((product) {
      imageMap.addIf(true, product.id, product.image1);
    }).toList();
    prodList.map((product) {
      nameMap.addIf(true, product.id, product.productName);
    }).toList();
    prodList.map((product) {
      tempWholeMap.addIf(true, product.id, product);
    }).toList();
  }

  // Adding to cart logic
  addToCart({String size, int product_id}) async {
    controller.switchOnLoader();
    String url = addToCartURL + product_id.toString() + "/" + size + "/";
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': "Token " + controller.token.value
    };
    http.Response response = await http.get(url, headers: headers);
    Map<String, dynamic> result = jsonDecode(response.body);
    if (result["success"] == "added to cart") {
      cartAmount.value = result["total_price"];
      controller.switchOffLoader();
      Get.rawSnackbar(
          title: 'Success',
          message: "Product Added",
          duration: Duration(seconds: 1));
    } else if (result["success"] == "update quantity of selected product") {
      cartAmount.value = result["total_price"];
      controller.switchOffLoader();
      Get.rawSnackbar(
          title: 'Success',
          message: "Quantity updated",
          duration: Duration(seconds: 1));
    } else if (result["success"] == "product added successfully") {
      cartAmount.value = result["total_price"];
      controller.switchOffLoader();
      Get.rawSnackbar(
          title: 'Success',
          message: "Product added",
          duration: Duration(seconds: 1));
    } else {
      controller.switchOffLoader();
      Get.rawSnackbar(
          title: 'Oops!',
          message: "Some error occurred",
          duration: Duration(seconds: 1));
    }
  }

  // Remove from cart
  removeFromCart({prodID, size}) async {
    String reURL = removeFromCartURL + prodID.toString() + "/" + size + "/";
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': "Token " + controller.token.value
    };
    try {
      controller.switchOnLoader();
      http.Response response = await http.get(reURL, headers: headers);
      await getCartItems();
      controller.switchOffLoader();
      Get.rawSnackbar(
          title: 'Success',
          message: 'Item removed',
          duration: Duration(seconds: 1));
    } catch (e) {
      print(e);
      controller.switchOffLoader();
      Get.rawSnackbar(
          title: 'Oops!',
          message: 'Some error occured',
          duration: Duration(seconds: 1));
    }
  }

  // For saving a raw cart for any future use
  getCartItems() async {
    controller.switchOnLoader();
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': "Token " + controller.token.value
    };
    try {
      // controller.switchOnLoader();
      http.Response response = await http.get(getCartURL, headers: headers);
      Map<String, dynamic> rawCartInfo = jsonDecode(response.body);
      cartItems.value = rawCartInfo['items'];
      // rawCartInfo['items'].map((cartItem) {
      //   cartItems.value.add(CartModel.fromJson(cartItem));
      // }).toList();
      cartCount.value = rawCartInfo['items'].length;
      cartAmount.value = rawCartInfo["total_price"];
      //controller.switchOffLoader();
      controller.switchOffLoader();
    } catch (e) {
      print(e);
      cartItems.value = [];
      controller.switchOffLoader();
    }
  }

  // For placing order
  placeOrder({int pk}) async {
    controller.switchOnLoader();
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': "Token " + controller.token.value
    };
    String url = orderConfirmURL + pk.toString();
    http.Response response = await http.get(url, headers: headers);
    Map<String, dynamic> result = jsonDecode(response.body);
    print(url);
    if (result['success'] == 'ordered') {
      controller.switchOffLoader();
      Get.offAll(
        OrderSucess(),
      );
      Get.rawSnackbar(
          title: 'Success',
          message: 'Your order was placed succesfully',
          duration: Duration(seconds: 1));
    } else {
      controller.switchOffLoader();
      Get.back();
      Get.rawSnackbar(
          title: 'Ooops!',
          message: 'Some error occured...',
          duration: Duration(seconds: 1));
    }
  }

  @override
  void onInit() {
    getCartItems();
    super.onInit();
  }
}

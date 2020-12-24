import 'dart:convert';

import 'package:craftly/bloc/bloc/product_bloc.dart';
import 'package:craftly/controllers/authController.dart';
import 'package:craftly/data/models/addressModel.dart';
import 'package:craftly/helpers/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ExternalServiceController extends GetxController {
  AuthController controller = Get.find();

  //For saving addresses
  Rx<List<AddressModel>> addresses = Rx<List<AddressModel>>();

  addToWishList({int ProdID}) async {
    controller.switchOnLoader();
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token ' + controller.token.value
    };
    await http
        .get(addWishlistURL + ProdID.toString(), headers: headers)
        .then((value) {
      Map<String, dynamic> response = jsonDecode(value.body);
      if (response["suucess"] == "product added to wishlist") {
        controller.switchOffLoader();
        Get.rawSnackbar(
            title: 'Added',
            message: 'Product wishlisted',
            duration: Duration(seconds: 1));
      } else if (response["item already present"] ==
          "this item was previously wishlisted") {
        controller.switchOffLoader();
        Get.rawSnackbar(
            title: 'Whyyy?',
            message: 'Product already wishlisted',
            duration: Duration(seconds: 1));
      } else {
        controller.switchOffLoader();
        Get.rawSnackbar(
            title: 'Oops!',
            message: 'Some error occured',
            duration: Duration(seconds: 1));
      }
    }).catchError((e) {
      print(e);
      controller.switchOffLoader();
      Get.rawSnackbar(
          title: 'Oops!',
          message: 'Some error occured',
          duration: Duration(seconds: 1));
    });
  }

  removeFromoWishList({int ProdID, BuildContext context}) async {
    controller.switchOnLoader();
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token ' + controller.token.value
    };
    await http
        .get(removeFromWishListURL + ProdID.toString(), headers: headers)
        .then((value) {
      Map<String, dynamic> response = jsonDecode(value.body);
      if (response["success"] == "removed product from wishlist") {
        controller.switchOffLoader();
        BlocProvider.of<ProductBloc>(context).add(GotoWishList());
        Get.rawSnackbar(
            title: 'Removed',
            message: 'Product removed from wishlist',
            duration: Duration(seconds: 1));
      } else if (response["item already present"] ==
          "this item was previously wishlisted") {
        controller.switchOffLoader();
        BlocProvider.of<ProductBloc>(context).add(GotoWishList());
        Get.rawSnackbar(
            title: 'Success',
            message: 'Product removed from wishlist',
            duration: Duration(seconds: 1));
      } else {
        controller.switchOffLoader();
        BlocProvider.of<ProductBloc>(context).add(GotoWishList());
        Get.rawSnackbar(
            title: 'Oops!',
            message: 'Some error occured',
            duration: Duration(seconds: 1));
      }
      print(response);
    }).catchError((e) {
      print(e);
      controller.switchOffLoader();
      Get.rawSnackbar(
          title: 'Oops!',
          message: 'Some error occured',
          duration: Duration(seconds: 1));
    });
  }

  // For saving user address
  addAddress(
      {name,
      contact,
      pincode,
      locality,
      address,
      city,
      state,
      bool isUpdate,
      int id}) async {
    controller.switchOnLoader();
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token ' + controller.token.value
    };
    Map<String, String> body = {
      'name': name,
      'pincode': pincode,
      'contact_no': contact,
      'locality': locality,
      'address': address,
      'city': city,
      'state': state
    };
    if (isUpdate) {
      http.Response response = await http.patch(
          updateAddressURL + id.toString() + "/",
          headers: headers,
          body: jsonEncode(body));
      controller.switchOffLoader();
      Get.rawSnackbar(
          title: 'Updated',
          message: 'Address updated',
          duration: Duration(seconds: 1));
    } else {
      try {
        http.Response response = await http.post(addAddressURL,
            headers: headers, body: jsonEncode(body));
        Map<String, dynamic> result = jsonDecode(response.body);
        if (result["saved"] == "address saved successfully") {
          await getAddress();
          controller.switchOffLoader();
          Get.rawSnackbar(
              title: 'Saved',
              message: 'Address saved',
              duration: Duration(seconds: 1));
        } else {
          controller.switchOffLoader();
          Get.rawSnackbar(
              title: 'Oops!',
              message: 'Some error occurred',
              duration: Duration(seconds: 1));
        }
      } catch (e) {
        controller.switchOffLoader();
        Get.rawSnackbar(
            title: 'Oops!esrg',
            message: 'Some error occurred',
            duration: Duration(seconds: 1));
      }
    }
  }

  // For getting addresses
  getAddress() async {
    addresses.value = [];
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token ' + controller.token.value
    };
    http.Response response = await http.get(getAddressURL, headers: headers);
    List result = jsonDecode(response.body);
    result.map((address) {
      addresses.value.add(AddressModel.fromJson(address));
    }).toList();
  }

  // Delete address
  deleteAddress({int pk, BuildContext context}) async {
    controller.switchOnLoader();
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token ' + controller.token.value
    };
    http.Response response = await http
        .delete(deleteAddressURL + pk.toString() + "/", headers: headers);
    getAddress();
    controller.switchOffLoader();
    BlocProvider.of<ProductBloc>(context).add(GetAddress());
  }

  @override
  void onInit() {
    super.onInit();
    getAddress();
  }
}

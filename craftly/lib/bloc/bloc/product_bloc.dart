import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:craftly/controllers/cartController.dart';
import 'package:craftly/data/models/addressModel.dart';
import 'package:craftly/data/models/order_model.dart';
import 'package:craftly/data/models/productModel.dart';
import 'package:craftly/data/models/promoModel.dart';
import 'package:craftly/data/models/userModel.dart';
import 'package:craftly/data/provider/accountProvider.dart';
import 'package:craftly/data/provider/address_provider.dart';
import 'package:craftly/data/provider/getOrders.dart';
import 'package:craftly/data/provider/getPromo.dart';
import 'package:craftly/data/provider/productProvider.dart';
import 'package:craftly/data/provider/searchProvider.dart';
import 'package:craftly/data/provider/wishlist_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is GetProducts) {
      yield Loading();
      List<Product> products = await getProducts();
      CartController cartController = Get.put(CartController());
      cartController.setImageMap(prodList: products);
      List<Promo> promos = await getPromo();
      yield Loaded(products: products, promos: promos);
    } else if (event is GetAccount) {
      yield Loading();
      try {
        User account = await getAccountDetails();
        yield AccountDetail(userAccount: account);
      } catch (e) {
        yield LoadingFailed();
      }
    } else if (event is SearchProducts) {
      yield Loading();
      try {
        Get.back();
        List<Product> products =
            await getSearchedProducts(searchFor: event.query);
        yield SearchLoaded(products: products);
      } catch (e) {
        print(e);
      }
    } else if (event is GotoWishList) {
      yield Loading();
      try {
        Get.back();
        List<Product> products = await getWishList();
        yield WishListPage(products: products);
      } catch (e) {
        print(e);
        yield LoadingFailed();
      }
    } else if (event is GetAddress) {
      yield Loading();
      try {
        List<AddressModel> addresses = await getAddress();
        yield AddressLoaded(addresses: addresses);
      } catch (e) {
        print(e);
        yield LoadingFailed();
      }
    } else if (event is GetOrders) {
      yield Loading();
      try {
        List<Order> orders = await getOrders();
        yield OrdersFetched(orders: orders);
      } catch (e) {
        yield OrdersNotFetched();
      }
    } else {}
  }
}

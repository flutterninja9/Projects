import 'package:craftly/bloc/bloc/product_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class UIController extends GetxController {
  Rx<int> selectedIndex = Rx<int>();

  // Selecting index on bottom navBar
  changeIndex({int index}) {
    selectedIndex.value = index;
  }

  manageHomePage({int index, BuildContext context}) {
    if (index == 0) {
      changeIndex(index: index);
      BlocProvider.of<ProductBloc>(context).add(GetProducts());
    } else if (index == 1) {
      Get.defaultDialog(
          title: 'Search for',
          content: Padding(
            padding:
                const EdgeInsets.only(top: 15, bottom: 30, left: 25, right: 25),
            child: TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Feather.search,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
              onFieldSubmitted: (query) async {
                BlocProvider.of<ProductBloc>(context)
                    .add(SearchProducts(query: query));
              },
            ),
          ));
      changeIndex(index: index);
    } else if (index == 2) {
      changeIndex(index: index);
      BlocProvider.of<ProductBloc>(context).add(GotoWishList());
    } else {
      changeIndex(index: index);
      BlocProvider.of<ProductBloc>(context).add(GetAccount());
    }
  }

  @override
  void onInit() {
    selectedIndex.value = 0;
    super.onInit();
  }
}

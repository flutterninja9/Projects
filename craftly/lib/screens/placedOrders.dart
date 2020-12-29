import 'package:craftly/bloc/bloc/product_bloc.dart';
import 'package:craftly/controllers/cartController.dart';
import 'package:craftly/screens/widgets/loading.dart';
import 'package:craftly/screens/widgets/orderCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrders extends StatelessWidget {
  CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              BlocProvider.of<ProductBloc>(context).add(GetAccount());
              Get.back();
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text(
            "Your Orders",
            style: GoogleFonts.poppins(),
          ),
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is Loading) {
              return LoadingWidget();
            } else if (state is OrdersFetched) {
              return Container(
                height: Get.height,
                width: Get.width,
                child: ListView.builder(
                  itemCount: state.orders.length,
                  itemBuilder: (context, index) {
                    return OrderCard(order: state.orders[index]);
                  },
                ),
              );
            } else if (state is OrdersNotFetched) {
              return LoadingWidget();
            } else {
              return LoadingWidget();
            }
          },
        ));
  }
}

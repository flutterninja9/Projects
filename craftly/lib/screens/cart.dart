import 'package:craftly/controllers/authController.dart';
import 'package:craftly/controllers/cartController.dart';
import 'package:craftly/screens/finalDeliveryCheckView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  CartController cartController = Get.put(CartController());
  AuthController controller = Get.find();
  @override
  void initState() {
    cartController.getCartItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("You cart",
              style:
                  GoogleFonts.montserrat(color: Color.fromRGBO(18, 18, 18, 1))),
          elevation: 1,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color.fromRGBO(18, 18, 18, 1)),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Stack(
          children: [
            Obx(
              () => controller.logging_in.value == 'true'
                  ? LinearProgressIndicator()
                  : Container(),
            ),
            Container(
                height: Get.height,
                width: Get.width,
                child: Obx(() => cartController.cartItems.value.isEmpty
                    ? Container()
                    : ListView.builder(
                        itemCount: cartController.cartItems.value.length != null
                            ? cartController.cartCount.value
                            : 0,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.network(cartController.imageMap[
                                cartController.cartItems.value[index]['pID']]),
                            title: Text(cartController.nameMap[
                                cartController.cartItems.value[index]['pID']]),
                            subtitle: Row(
                              children: [
                                Text("Size " +
                                    cartController.cartItems.value[index]
                                        ["size"]),
                                SizedBox(
                                  width: Get.width * 0.03,
                                ),
                                Text("Quantity " +
                                    cartController
                                        .cartItems.value[index]["quantity"]
                                        .toString()),
                              ],
                            ),
                            trailing: IconButton(
                              onPressed: () async {
                                cartController.removeFromCart(
                                    prodID: cartController
                                        .cartItems.value[index]['pID'],
                                    size: cartController.cartItems.value[index]
                                        ["size"]);
                              },
                              icon: Icon(Icons.delete),
                            ),
                          );
                        },
                      ))),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Get.to(FinalDeliveryView(), transition: Transition.downToUp);
                },
                child: Container(
                  height: 60,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(4)),
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Total amount : ",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              Obx(() => controller.logging_in.value == "true"
                                  ? SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.amber),
                                      ))
                                  : Text(
                                      cartController.cartItems.value.isEmpty
                                          ? "_ _ _"
                                          : "₹" +
                                              cartController.cartAmount.value,
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)))
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.fast_forward,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Obx(() => controller.logging_in.value == "true"
                ? LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor),
                  )
                : Container()),
          ],
        ));
  }
}

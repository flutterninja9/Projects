import 'package:craftly/controllers/authController.dart';
import 'package:craftly/controllers/cartController.dart';
import 'package:craftly/controllers/externalServiceHandler.dart';
import 'package:craftly/screens/address_intro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FinalDeliveryView extends StatefulWidget {
  @override
  _FinalDeliveryViewState createState() => _FinalDeliveryViewState();
}

class _FinalDeliveryViewState extends State<FinalDeliveryView> {
  ExternalServiceController serviceController = Get.find();
  AuthController controller = Get.find();
  int defSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a delivery address', style: GoogleFonts.poppins()),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: serviceController.addresses.value.length > 0
            ? Stack(
                children: [
                  ListView.builder(
                    itemCount: serviceController.addresses.value.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                defSelected = index;
                              });
                            },
                            child: Card(
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            serviceController.addresses
                                                .value[index].toWhomDelivery,
                                            style: GoogleFonts.roboto(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            "Contact : " +
                                                serviceController.addresses
                                                    .value[index].contactNo,
                                            style: GoogleFonts.roboto(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                              "Address : " +
                                                  serviceController.addresses
                                                      .value[index].address,
                                              style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400)),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                              "Locality : " +
                                                  serviceController.addresses
                                                      .value[index].locality,
                                              style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400)),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                              "City : " +
                                                  serviceController.addresses
                                                      .value[index].city,
                                              style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400)),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                              "State : " +
                                                  serviceController.addresses
                                                      .value[index].state
                                                      .toString(),
                                              style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400)),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          defSelected == index
                              ? Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                      margin:
                                          EdgeInsets.only(top: 8, right: 10),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              Theme.of(context).primaryColor),
                                      child: Icon(
                                        Icons.done,
                                        color: Colors.white,
                                      )),
                                )
                              : Container()
                        ],
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: Get.width,
                      padding: EdgeInsets.symmetric(vertical: 4),
                      decoration:
                          BoxDecoration(color: Theme.of(context).primaryColor),
                      child: MaterialButton(
                          onPressed: () async {
                            CartController cartController = Get.find();
                            await cartController.placeOrder(
                                pk: serviceController
                                    .addresses.value[defSelected].id);
                          },
                          splashColor:
                              Theme.of(context).primaryColor.withOpacity(0.6),
                          child: Obx(() => controller.logging_in.value == 'true'
                              ? Container(
                                  child: Center(
                                    child: SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.amber),
                                      ),
                                    ),
                                  ),
                                )
                              : Text("Place Order",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)))),
                    ),
                  ),
                ],
              )
            : Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error,
                          size: 70,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('No saved address found!',
                            style: GoogleFonts.ubuntu(fontSize: 18)),
                        SizedBox(
                          height: 8,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(AddressIntro());
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).primaryColor)),
                            child: Text("Add address",
                                style: GoogleFonts.ubuntu(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ],
                    )),
                  ),
                ],
              ),
      ),
    );
  }
}

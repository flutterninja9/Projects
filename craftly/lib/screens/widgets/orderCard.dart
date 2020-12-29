import 'package:craftly/controllers/cartController.dart';
import 'package:craftly/data/models/order_model.dart';
import 'package:craftly/helpers/urls.dart';
import 'package:craftly/screens/orderRecipet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

CartController cartController = Get.find();

Widget OrderCard({Order order}) {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    child: Card(
        elevation: 2,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Order ID : ",
                    style: GoogleFonts.ubuntu(),
                  ),
                  Text(
                    order.id.toString(),
                    style: GoogleFonts.ubuntu(),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Delivery Status : ",
                    style: GoogleFonts.ubuntu(),
                  ),
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: cartController.orderStatus[order.orderStatus]),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Reference ID : ",
                    style: GoogleFonts.ubuntu(),
                  ),
                  Text(
                    order.refId.toString(),
                    style: GoogleFonts.ubuntu(),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Ordered on : ",
                    style: GoogleFonts.ubuntu(),
                  ),
                  Text(
                    order.orderedDate.toString(),
                    style: GoogleFonts.ubuntu(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MaterialButton(
                      onPressed: () {
                        Get.to(OrderReciept(
                            mediaUrl:
                                "https://craftly.pythonanywhere.com/media/static/reciepts/" +
                                    order.refId +
                                    ".pdf"));
                      },
                      color: Colors.green,
                      child: Text("Generate Reciept",
                          style: GoogleFonts.ubuntu(
                              color: Colors.white,
                              fontWeight: FontWeight.w500))),
                  SizedBox(
                    width: 10,
                  ),
                  order.orderStatus == 'o'
                      ? MaterialButton(
                          onPressed: () {},
                          color: Colors.red,
                          child: Text("Cancel Order",
                              style: GoogleFonts.ubuntu(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500)))
                      : MaterialButton(
                          onPressed: () {},
                          color: Colors.amber,
                          child: Text("Request return",
                              style: GoogleFonts.ubuntu(
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.w500))),
                ],
              ),
            ],
          ),
        )),
  );
}

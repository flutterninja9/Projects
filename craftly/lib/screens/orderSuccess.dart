import 'package:craftly/screens/home.dart';
import 'package:craftly/screens/orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderSucess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                      child: Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 60,
                      )),
                  Text("Ordered Successfully",
                      style: GoogleFonts.manrope(
                          height: 2,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.green)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.offAll(Orders());
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                  color: Theme.of(context).primaryColor)),
                          child: Center(
                            child: Text("View orders",
                                style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.pink)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      InkWell(
                        onTap: () {
                          Get.offAll(HomeScreen());
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                  color: Theme.of(context).primaryColor)),
                          child: Center(
                            child: Text("Homepage",
                                style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.pink)),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

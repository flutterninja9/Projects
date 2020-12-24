import 'package:craftly/screens/login.dart';
import 'package:craftly/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Container(
                height: Get.height,
                width: Get.width,
                child: CustomPaint(
                  size: Size(Get.width, Get.height),
                  painter: RPSCustomPainter(),
                )),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.only(
                    top: Get.height * 0.053, left: Get.width * 0.045),
                child: Text(
                  "CraftLy.",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: Get.height * 0.034,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width,
                      margin: EdgeInsets.only(
                          left: Get.width * 0.02,
                          right: Get.width * 0.02,
                          bottom: Get.width * 0.02),
                      padding: EdgeInsets.all(Get.height * 0.007),
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(25)),
                      child: MaterialButton(
                        onPressed: () {
                          Get.to(Login());
                        },
                        child: Text("Get Started",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: Get.height * 0.022,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      width: Get.width,
                      margin: EdgeInsets.only(
                          left: Get.width * 0.02,
                          right: Get.width * 0.02,
                          bottom: Get.width * 0.02),
                      padding: EdgeInsets.all(Get.height * 0.007),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.pink, width: 1.5),
                          borderRadius: BorderRadius.circular(25)),
                      child: MaterialButton(
                        onPressed: () {
                          Get.to(Register());
                        },
                        child: Text("Sign-up",
                            style: GoogleFonts.poppins(
                                color: Colors.pink,
                                fontSize: Get.height * 0.022,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Colors.pink
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(0, size.height * 0.28);
    path_0.lineTo(size.width * 0.50, size.height * 0.42);
    path_0.lineTo(size.width, size.height * 0.28);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(0, 0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/views/home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      Get.off(HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/stories_snow.png")
                )
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: Get.width/2.7,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "W",
                    style: GoogleFonts.bebasNeue(fontSize: 22,letterSpacing: 2,color: Colors.black,fontWeight: FontWeight.w500)
                  ),
                  TextSpan(
                    text: "EATHERLY",
                    style: GoogleFonts.bebasNeue(fontSize: 22,letterSpacing: 2,color: Colors.grey,fontWeight: FontWeight.w500)
                  ),
                  TextSpan(
                      text: " INC.",
                      style: GoogleFonts.bebasNeue(fontSize: 22,letterSpacing: 1.5,color: Colors.grey,fontWeight: FontWeight.w500)
                  ),
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}

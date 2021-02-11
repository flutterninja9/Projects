import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/home_screen_controller.dart';
import '../../models/wallpaper.dart';
import '../widgets/wallpaperCard.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );
    double gauss = exp(-(pow((controller.offsetCards.abs() - 0.5), 2) / 0.08));
    return Scaffold(
      body: Stack(
        children: [
          Obx(() => Container(
                height: Get.height,
                width: Get.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(controller.currentBg.value),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                    height: Get.height,
                    width: Get.width,
                    color: Colors.grey[50].withOpacity(0.2),
                    child: Container(),
                  ),
                ),
              )),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 45),
              child: Column(
                children: [
                  Obx(
                    () => Transform.translate(
                      offset: Offset(-20 * gauss * _getOffsetTitle(), 0.0),
                      child: Text(
                        controller.currentCat.value,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => Text(
                      "Enjoy awesome ${controller.currentCat.value} wallpapers.",
                      style: GoogleFonts.manrope(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 600,
              width: Get.width,
              margin: EdgeInsets.only(bottom: 20),
              child: Obx(
                () => PageView.builder(
                  controller: controller.scrollController,
                  itemCount: controller.wallpapers.value.length,
                  itemBuilder: (context, index) {
                    Wallpaper wallpaper = controller.wallpapers.value[index];
                    return WallpaperCard(
                      wallpaper: wallpaper,
                      index: index,
                      controller: controller,
                    );
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () => null,
                      icon: Icon(Icons.screen_lock_portrait_outlined),
                      color: Colors.purple,
                      iconSize: 40,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () => null,
                      icon: Icon(Icons.home_filled),
                      color: Colors.white,
                      iconSize: 40,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () => null,
                      icon: Icon(Icons.account_circle),
                      color: Colors.white,
                      iconSize: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

double _getOffsetTitle() {
  HomeScreenController controller = Get.find();
  final offset =
      controller.offsetCards.value - controller.offsetCards.value.toInt();
  return offset;
}

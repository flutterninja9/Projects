import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottomButton.dart';

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
                    // a = -25.0
                    // b = 0.0
                    () => Transform.translate(
                      offset: Offset(-controller.offset.value * 0.01, 0.0),
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
              height: Get.height * 0.75,
              width: Get.width,
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
                      isLongCard: true,
                    );
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomButtons(),
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

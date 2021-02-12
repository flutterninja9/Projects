import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
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
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      body: Obx(() => controller.isLoading.value
          ? Container(
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 1.5,
                ),
              ),
            )
          : Stack(
              children: [
                Obx(() => Stack(
                      children: [
                        ImageFiltered(
                          imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                              height: Get.height,
                              width: Get.width,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: controller.currentBg.value,
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder: (context, url,
                                            downloadProgress) =>
                                        Center(
                                            child: CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress)),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ],
                              )),
                        ),
                      ],
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
                            () => Text(
                                  controller.currentCat.value,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
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
                          Wallpaper wallpaper =
                              controller.wallpapers.value[index];
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
                  child: BottomButtons(
                    controller: controller,
                  ),
                ),
              ],
            )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_screen_controller.dart';
import '../../models/wallpaper.dart';

class WallpaperCard extends StatelessWidget {
  final HomeScreenController controller;
  WallpaperCard({
    Key key,
    this.controller,
    @required this.wallpaper,
    this.index,
  }) : super(key: key);

  final Wallpaper wallpaper;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      width: Get.width,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Obx(
          () => Transform.scale(
            scale: (controller.offsetCards.value - index).abs() + 1.2,
            child: Transform.rotate(
              angle: -(controller.offsetCards.value - index).abs(),
              child: Image.network(
                wallpaper.imageURL,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_screen_controller.dart';
import '../../models/wallpaper.dart';

class WallpaperCard extends StatelessWidget {
  final HomeScreenController controller;
  final bool isLongCard;
  WallpaperCard({
    Key key,
    this.controller,
    this.isLongCard,
    @required this.wallpaper,
    this.index,
  }) : super(key: key);

  final Wallpaper wallpaper;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(
          color: Colors.grey[600],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Obx(
          () => Transform.scale(
            scale: (controller.offsetCards.value - index).abs() + 1.2,
            child: Transform.rotate(
              angle: -(controller.offsetCards.value - index).abs(),
              child: CachedNetworkImage(
                imageUrl: wallpaper.imageCompressed,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

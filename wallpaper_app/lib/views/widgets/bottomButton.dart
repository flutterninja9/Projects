import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_screen_controller.dart';
import '../../core/utils/wallpaperSetter.dart';

class BottomButtons extends StatelessWidget {
  final HomeScreenController controller;
  const BottomButtons({
    this.controller,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () async {
                Get.rawSnackbar(
                    title: 'Hold on',
                    message: 'Wallpaper is being set',
                    duration: Duration(seconds: 1));
                Future.delayed(Duration(seconds: 2), () async {
                  final String result = await wallpaperSetter(
                    imageUrl: controller.wallpapers
                        .value[controller.offsetCards.toInt()].imageURL,
                    screenType: 2,
                  );
                  Get.rawSnackbar(
                      title: 'Result',
                      message: result,
                      duration: Duration(seconds: 1));
                });
              },
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
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
              child: InkWell(
                onTap: () async {
                  Get.rawSnackbar(
                      title: 'Hold on',
                      message: 'Wallpaper is being set',
                      duration: Duration(seconds: 1));
                  Future.delayed(Duration(seconds: 2), () async {
                    final String result = await wallpaperSetter(
                      imageUrl: controller.wallpapers
                          .value[controller.offsetCards.toInt()].imageURL,
                      screenType: 1,
                    );
                    Get.rawSnackbar(
                        title: 'Result',
                        message: result,
                        duration: Duration(seconds: 1));
                  });
                },
                child: Icon(
                  Icons.home_filled,
                  color: Colors.white,
                  size: 40,
                ),
              )),
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
              icon: Icon(Icons.category_outlined),
              color: Colors.white,
              iconSize: 40,
            ),
          ),
        ],
      ),
    );
  }
}

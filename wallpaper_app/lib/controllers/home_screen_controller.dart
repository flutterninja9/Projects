import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/constants/wallpapers.dart';
import '../models/wallpaper.dart';

class HomeScreenController extends GetxController {
  Rx<List<Wallpaper>> wallpapers = Rx<List<Wallpaper>>();
  var currentBg = ''.obs;
  var currentCat = ''.obs;
  PageController scrollController = PageController();
  var offset = 0.0.obs;
  var offsetCards = 0.0.obs;

  // setup wallpapers
  void setupWallpapers() {
    wallpapers.value = [];
    wallpapersRaw['wallapers'].map((rawWallpaper) {
      wallpapers.value.add(Wallpaper.fromMap(rawWallpaper));
    }).toList();
    currentBg.value = wallpapers.value[0].imageURL;
    currentCat.value = wallpapers.value[0].category;
  }

  //setupOffsetCards()
  setupOffsetCards(double offsetCard) {
    offsetCards.value = offsetCard;
  }

  @override
  void onInit() {
    setupWallpapers();
    scrollController = PageController(viewportFraction: 0.8);
    scrollController.addListener(() {
      offset.value = scrollController.offset;
      offsetCards.value = scrollController.page;
      currentBg.value =
          wallpapers.value[(scrollController.page).toInt()].imageURL;
      currentCat.value =
          wallpapers.value[(scrollController.page).toInt()].category;
    });
    super.onInit();
  }
}

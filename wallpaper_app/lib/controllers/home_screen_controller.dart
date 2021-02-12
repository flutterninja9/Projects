import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/wallpaper.dart';

class HomeScreenController extends GetxController {
  Rx<List<Wallpaper>> wallpapers = Rx<List<Wallpaper>>();
  var currentBg = ''.obs;
  var currentCat = ''.obs;
  PageController scrollController = PageController();
  var offset = 0.0.obs;
  var offsetCards = 0.0.obs;
  var isLoading = false.obs;

  // setup wallpapers
  // add ?auto=compress in the thumbnails
  // url for fetching images is
  // https://anirudh1998.pythonanywhere.com/wallpapers/get
  void setupWallpapers() async {
    isLoading.value = true;
    wallpapers.value = [];
    http.Response response =
        await http.get('https://anirudh1998.pythonanywhere.com/wallpapers/get');
    if (response.statusCode == 200) {
      List rawResponse = jsonDecode(response.body);
      rawResponse.map((rawWallpaper) {
        wallpapers.value.add(Wallpaper.fromMap(rawWallpaper));
      }).toList();
      // For getting the updated ones first
      wallpapers.value = wallpapers.value.reversed.toList();
      currentBg.value = wallpapers.value[0].imageURL;
      currentCat.value = wallpapers.value[0].category;
      isLoading.value = false;
    } else {
      isLoading.value = false;
      throw Exception('Error fetching data from the server');
    }
  }

  @override
  void onInit() {
    setupWallpapers();
    scrollController = PageController(viewportFraction: 0.85);
    scrollController.addListener(() {
      offset.value = scrollController.offset;
      offsetCards.value = scrollController.page;
      currentBg.value =
          wallpapers.value[(scrollController.page).toInt()].imageCompressed;
      currentCat.value =
          wallpapers.value[(scrollController.page).toInt()].category;
    });
    super.onInit();
  }
}

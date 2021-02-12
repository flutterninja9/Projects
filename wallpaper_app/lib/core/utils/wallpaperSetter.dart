import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';

Future<String> wallpaperSetter({String imageUrl, int screenType}) async {
  // HOME_SCREEN = 1
  // LOCK_SCREEN = 2
  int location = screenType; // or location = WallpaperManager.LOCK_SCREEN;

  var file = await DefaultCacheManager().getSingleFile(imageUrl);
  final String result =
      await WallpaperManager.setWallpaperFromFile(file.path, location);
  return result;
}

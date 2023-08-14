// ignore_for_file: unrelated_type_equality_checks

import 'dart:io';

import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future setWallpaper(String url, {String? choice}) async {
  final image = await fetchAndConvertImage(url);
  switch (choice) {
    case 'home':
      WallpaperManager.setWallpaperFromFile(
              image.path, WallpaperManager.HOME_SCREEN)
          .then((value) =>
              Fluttertoast.showToast(msg: 'Home screen wallpaper set'));

      break;
    case 'lock':
      WallpaperManager.setWallpaperFromFile(
              image.path, WallpaperManager.LOCK_SCREEN)
          .then((value) =>
              Fluttertoast.showToast(msg: 'Lock screen wallpaper set'));
      break;
    default:
      WallpaperManager.setWallpaperFromFile(
              image.path, WallpaperManager.BOTH_SCREEN)
          .then((value) => Fluttertoast.showToast(msg: 'Wallpaper set'));
  }
}

Future<File> fetchAndConvertImage(String imageUrl) async {
  final response = await http.get(Uri.parse(imageUrl));
  final bytes = response.bodyBytes;

  final tempDir = await getTemporaryDirectory();
  final tempFile = File('${tempDir.path}/temp_image.jpg');
  await tempFile.writeAsBytes(bytes);

  return tempFile;
}

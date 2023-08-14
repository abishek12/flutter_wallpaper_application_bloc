import 'package:flutter/material.dart';

import '../helper/save_image.dart';
import '../widget/favorite_button_widget.dart';
import '../widget/full_screen_image.dart';
import '../widget/icon_button_widget.dart';
import '../widget/wallpaper_button_widget.dart';

class WallPaperScreen extends StatelessWidget {
  final String imageName;
  final int imageId;
  final String url;
  final String photographer;
  final String photographerUrl;
  final String avgColor;
  const WallPaperScreen({
    super.key,
    required this.imageName,
    required this.imageId,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.avgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FullScreenImage(
            imageName: imageName,
            avgColor: avgColor,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black45,
                    Colors.black26,
                  ],
                ),
              ),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButtonWidget(
                    iconData: Icons.download,
                    onPressed: () => saveImage(imageName),
                  ),
                  FavoriteButtonWidget(
                    imageId: imageId,
                    url: url,
                    photographer: photographer,
                    photographerUrl: photographerUrl,
                    imageUrl: imageName,
                  ),
                  WallpaperButtonWidget(
                    imageName: imageName,
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

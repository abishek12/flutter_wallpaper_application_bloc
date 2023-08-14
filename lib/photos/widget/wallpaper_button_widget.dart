import 'package:flutter/material.dart';

import '../helper/set_wallpaper.dart';
import 'icon_button_widget.dart';

class WallpaperButtonWidget extends StatelessWidget {
  final String imageName;
  const WallpaperButtonWidget({
    super.key,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return IconButtonWidget(
      iconData: Icons.wallpaper,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => Wrap(
            children: [
              ListTile(
                onTap: () {
                  setWallpaper(imageName, choice: 'home');
                },
                title: const Text("Home Screen"),
              ),
              ListTile(
                onTap: () => setWallpaper(imageName, choice: 'lock'),
                title: const Text("Lock Screen"),
              ),
              ListTile(
                onTap: () => setWallpaper(imageName),
                title: const Text("Lock Screen"),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FullScreenImage extends StatelessWidget {
  final String imageName;
  final String avgColor;
  const FullScreenImage({
    super.key,
    required this.imageName,
    required this.avgColor,
  });

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      constrained: false,
      minScale: 0.6,
      maxScale: 1.3,
      child: CachedNetworkImage(
        imageUrl: imageName,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              HexColor(avgColor),
              BlendMode.color,
            ),
          ),
        ),
      ),
    );
  }
}

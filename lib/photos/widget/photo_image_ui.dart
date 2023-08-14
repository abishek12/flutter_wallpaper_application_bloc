import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PhotoImageUi extends StatelessWidget {
  final String imageName;
  final String avgColor;
  const PhotoImageUi({
    super.key,
    required this.imageName,
    required this.avgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
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
      ),
    );
  }
}

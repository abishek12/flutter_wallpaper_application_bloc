import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../views/wallpaper_screen.dart';
import 'photo_image_ui.dart';

class PhotosUi extends StatefulWidget {
  final dynamic model;
  const PhotosUi({
    super.key,
    required this.model,
  });

  @override
  State<PhotosUi> createState() => _PhotosUiState();
}

class _PhotosUiState extends State<PhotosUi> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MasonryGridView.builder(
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: widget.model.perPage,
        itemBuilder: (context, index) {
          final item = widget.model.photos![index];
          final String imageName = '${item.src!.large2x}';
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WallPaperScreen(
                  imageName: imageName,
                  imageId: widget.model.photos[index].id,
                  photographer: widget.model.photos[index].photographer,
                  photographerUrl: widget.model.photos[index].photographerUrl,
                  url: widget.model.photos[index].url,
                  avgColor: '${item.avgColor}',
                ),
              ),
            ),
            child: PhotoImageUi(
              imageName: imageName,
              avgColor: widget.model.photos[index].avgColor,
            ),
          );
        },
      ),
    );
  }
}

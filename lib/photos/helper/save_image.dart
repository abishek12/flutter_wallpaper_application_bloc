import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

saveImage(String imageName) async {
  final response = await http.get(Uri.parse(imageName));
  await ImageGallerySaver.saveImage(
    Uint8List.fromList(response.bodyBytes),
  );
}

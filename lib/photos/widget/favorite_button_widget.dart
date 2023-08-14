import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../helper/add_to_favorite.dart';
import 'icon_button_widget.dart';

class FavoriteButtonWidget extends StatelessWidget {
  final int imageId;
  final String url;
  final String photographer;
  final String photographerUrl;
  final String imageUrl;
  const FavoriteButtonWidget({
    super.key,
    required this.imageId,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return IconButtonWidget(
            iconData: Icons.favorite_outline,
            onPressed: () {
              snapshot.hasData
                  ? addToFavorite(
                      imageId: imageId,
                      url: url,
                      photographer: photographer,
                      photographerUrl: photographerUrl,
                      imageUrl: imageUrl,
                    )
                  : Fluttertoast.showToast(
                      msg: 'Login to continue...',
                    );
            },
          );
        });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

addToFavorite({
  int? imageId,
  String? url,
  String? photographer,
  String? photographerUrl,
  String? imageUrl,
}) {
  String userId = FirebaseAuth.instance.currentUser!.uid;
  final users = FirebaseFirestore.instance.collection('gallery');
  try {
    users.add({
      'userId': userId,
      'imageId': imageId,
      'url': url,
      'photographer': photographer,
      'photographer_url': photographerUrl,
      'image_url': imageUrl,
    });

    Fluttertoast.showToast(msg: 'Image added to favorites');
  } catch (error) {
    Fluttertoast.showToast(msg: 'Failed to add image to favorites');
  }
}

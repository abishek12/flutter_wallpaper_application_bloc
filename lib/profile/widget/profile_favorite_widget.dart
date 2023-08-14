import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProfileFavoriteWidget extends StatelessWidget {
  const ProfileFavoriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final reference = FirebaseFirestore.instance.collection('gallery').where(
          'userId',
          isEqualTo: userId,
        );
    return SizedBox(
      height: 550,
      child: FutureBuilder(
          future: reference.get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MasonryGridView.builder(
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.network(
                        "${snapshot.data!.docs[index].get('image_url')}",
                      ),
                    );
                  });
            }
            if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

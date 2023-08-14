import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../bloc/photos_bloc.dart';
import '../widget/photos_ui.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  @override
  Widget build(BuildContext context) {
    //final List<PhotoModel> items = [];
    return BlocBuilder<PhotosBloc, PhotosState>(builder: (context, state) {
      if (state is PhotosInitial) {
        BlocProvider.of<PhotosBloc>(context).add(FetchPhotoItems());
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is PhotosLoaded) {
        final model = state.model;
        // setState(() {
        //   items.add(model);
        // });
        //debugPrint(items.toString());
        return LazyLoadScrollView(
          onEndOfPage: () =>
              BlocProvider.of<PhotosBloc>(context).add(FetchPhotoItems()),
          scrollOffset: 70,
          child: PhotosUi(
            model: model,
          ),
        );
      }
      if (state is PhotosError) {
        return Center(
          child: Text(state.errMessage),
        );
      }
      return Container();
    });
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/photo_model.dart';
import '../service/photo_service.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  int page = 0;
  int limit = 25;
  PhotoService service = PhotoService();
  PhotosBloc() : super(PhotosInitial()) {
    on<FetchPhotoItems>((event, emit) async {
      final model = await service.fetchPhotos(
        limit: limit,
        page: page++,
      );
      emit(PhotosLoaded(model: model));
    });
  }
}

part of 'photos_bloc.dart';

abstract class PhotosState extends Equatable {
  const PhotosState();

  @override
  List<Object> get props => [];
}

class PhotosInitial extends PhotosState {}

class PhotosError extends PhotosState {
  final String errMessage;

  const PhotosError({
    required this.errMessage,
  });
  @override
  List<Object> get props => [errMessage];
}

class PhotosLoaded extends PhotosState {
  final PhotoModel model;

  const PhotosLoaded({
    required this.model,
  });
  @override
  List<Object> get props => [model];
}

class PhotosLoading extends PhotosState {
  final PhotoModel oldModel;
  final bool isFirstFetch;

  const PhotosLoading({
    required this.oldModel,
    this.isFirstFetch = false,
  });

  @override
  List<Object> get props => [oldModel];
}

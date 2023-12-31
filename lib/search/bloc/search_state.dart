part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchError extends SearchState {
  final String errMessage;

  const SearchError({
    required this.errMessage,
  });
  @override
  List<Object> get props => [errMessage];
}

class SearchLoaded extends SearchState {
  final SearchModel model;
  const SearchLoaded({
    required this.model,
  });

  @override
  List<Object> get props => [model];
}

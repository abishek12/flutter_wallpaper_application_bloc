part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchFetchItems extends SearchEvent {
  final String query;
  const SearchFetchItems(this.query);
  @override
  List<Object> get props => [query];
}

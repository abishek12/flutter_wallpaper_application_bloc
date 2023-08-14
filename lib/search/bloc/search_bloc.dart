import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../photos/service/photo_service.dart';
import '../model/search_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  PhotoService service = PhotoService();
  int page = 0;
  int limit = 20;
  SearchBloc() : super(SearchInitial()) {
    on<SearchFetchItems>((event, emit) async {
      final model = await service.fetchSearchItem(
        event.query,
        limit: limit,
        page: page++,
      );
      emit(SearchLoaded(model: model));
    });
  }
}

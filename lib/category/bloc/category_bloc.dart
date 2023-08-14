import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/category_model.dart';
import '../services/cat_services.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryServices services = CategoryServices();
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryFetchItems>((event, emit) async {
      emit(CategoryInitial());
      try {
        final model = await services.fetchCategory();
        emit(CategorySuccess(model: model));
      } catch (error) {
        emit(
          CategoryError(errMessage: '$error'),
        );
      }
    });
  }
}

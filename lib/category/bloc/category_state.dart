part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryError extends CategoryState {
  final String errMessage;
  const CategoryError({
    required this.errMessage,
  });

  @override
  List<Object> get props => [errMessage];
}

class CategorySuccess extends CategoryState {
  final List<CategoryModel> model;

  const CategorySuccess({
    required this.model,
  });
  @override
  List<Object> get props => [model];
}

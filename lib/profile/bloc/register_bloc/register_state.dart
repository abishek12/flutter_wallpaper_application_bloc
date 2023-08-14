part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterLoading extends RegisterState {
  final bool isLoading;

  const RegisterLoading({
    required this.isLoading,
  });
  @override
  List<Object> get props => [isLoading];
}

class RegisterError extends RegisterState {
  final String errMessage;

  const RegisterError({
    required this.errMessage,
  });

  @override
  List<Object> get props => [errMessage];
}

class RegisterSuccess extends RegisterState {}

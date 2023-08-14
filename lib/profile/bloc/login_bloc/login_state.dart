part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  final bool isLoading;

  const LoginLoading({
    required this.isLoading,
  });
  @override
  List<Object> get props => [isLoading];
}

class LoginError extends LoginState {
  final String errMessage;

  const LoginError({
    required this.errMessage,
  });

  @override
  List<Object> get props => [errMessage];
}

class LoginSuccess extends LoginState {}

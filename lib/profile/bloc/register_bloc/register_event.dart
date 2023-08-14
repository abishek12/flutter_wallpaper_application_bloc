part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterOnChangeEvent extends RegisterEvent {
  final String strFullname;
  final String strEmail;
  final String strPassword;

  const RegisterOnChangeEvent({
    required this.strFullname,
    required this.strEmail,
    required this.strPassword,
  });
  @override
  List<Object> get props => [strFullname, strEmail, strPassword];
}

class RegisterOnSubmitEvent extends RegisterEvent {
  final String fullname;
  final String email;
  final String password;

  const RegisterOnSubmitEvent({
    required this.fullname,
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [fullname, email, password];
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helper/auth_helper.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    AuthHelper helper = AuthHelper();
    on<LoginOnChangeEvent>((event, emit) {
      if (event.strEmail.isEmpty) {
        emit(const LoginError(errMessage: 'Email is required'));
      } else if (event.strPassword.length <= 8) {
        emit(
          const LoginError(
            errMessage: 'Password length must be greater than 8',
          ),
        );
      } else {
        emit(LoginSuccess());
      }
    });
    on<LoginOnSubmitEvent>((event, emit) async {
      emit(const LoginLoading(isLoading: true));
      try {
        await helper.loginUser(event.email, event.password);
        emit(const LoginLoading(isLoading: false));
        emit(LoginSuccess());
      } catch (e) {
        emit(const LoginLoading(isLoading: false));
        throw Exception(e);
      }
    });
  }
}

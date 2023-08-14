import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helper/auth_helper.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    AuthHelper helper = AuthHelper();
    on<RegisterOnChangeEvent>((event, emit) {
      if (event.strEmail.isEmpty) {
        emit(const RegisterError(errMessage: 'Email is required'));
      } else if (event.strFullname.isEmpty) {
        emit(const RegisterError(errMessage: 'Fullname is required'));
      } else if (event.strPassword.length <= 8) {
        emit(const RegisterError(
            errMessage: 'Password length must be greater than 8'));
      } else {
        emit(RegisterSuccess());
      }
    });
    on<RegisterOnSubmitEvent>((event, emit) async {
      emit(const RegisterLoading(isLoading: true));
      try {
        await helper.createUser(event.fullname, event.email, event.password);
        emit(const RegisterLoading(isLoading: false));
        emit(RegisterSuccess());
      } catch (e) {
        emit(const RegisterLoading(isLoading: false));
        throw Exception(e);
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_bloc/login_bloc.dart';

class AuthErrorDisplay extends StatelessWidget {
  const AuthErrorDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      return state is LoginError ? Text(state.errMessage) : const Text('');
    });
  }
}

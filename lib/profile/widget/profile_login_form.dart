import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_bloc/login_bloc.dart';

class ProfileLoginForm extends StatefulWidget {
  const ProfileLoginForm({super.key});

  @override
  State<ProfileLoginForm> createState() => _ProfileLoginFormState();
}

class _ProfileLoginFormState extends State<ProfileLoginForm> {
  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    final email = TextEditingController();
    final password = TextEditingController();
    final formProvider = BlocProvider.of<LoginBloc>(context);
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Form(
          key: key,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: email,
                  onChanged: (value) {
                    formProvider.add(
                      LoginOnChangeEvent(
                        strEmail: email.text,
                        strPassword: password.text,
                      ),
                    );
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter Email',
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  onChanged: (value) {
                    formProvider.add(
                      LoginOnChangeEvent(
                        strEmail: email.text,
                        strPassword: password.text,
                      ),
                    );
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter password',
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: state is LoginSuccess
                          ? () async {
                              formProvider.add(
                                LoginOnSubmitEvent(
                                  email: email.text,
                                  password: password.text,
                                ),
                              );
                            }
                          : null,
                      child: state is LoginLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : const Text("Login"),
                    ),
                    // const Text('create account'),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/register_bloc/register_bloc.dart';

class ProfileRegisterForm extends StatefulWidget {
  const ProfileRegisterForm({super.key});

  @override
  State<ProfileRegisterForm> createState() => _ProfileRegisterFormState();
}

class _ProfileRegisterFormState extends State<ProfileRegisterForm> {
  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    final fullname = TextEditingController();
    final email = TextEditingController();
    final password = TextEditingController();
    final formProvider = BlocProvider.of<RegisterBloc>(context);
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Form(
          key: key,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: fullname,
                  onChanged: (value) {
                    formProvider.add(
                      RegisterOnChangeEvent(
                        strFullname: fullname.text,
                        strEmail: email.text,
                        strPassword: password.text,
                      ),
                    );
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter Fullname',
                    labelText: 'Fullname',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: email,
                  onChanged: (value) {
                    formProvider.add(
                      RegisterOnChangeEvent(
                        strFullname: fullname.text,
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
                      RegisterOnChangeEvent(
                        strFullname: fullname.text,
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
                      onPressed: state is RegisterSuccess
                          ? () async {
                              formProvider.add(
                                RegisterOnSubmitEvent(
                                  fullname: fullname.text,
                                  email: email.text,
                                  password: password.text,
                                ),
                              );
                            }
                          : null,
                      child: state is RegisterLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : const Text("Register"),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("back to login"),
                    ),
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

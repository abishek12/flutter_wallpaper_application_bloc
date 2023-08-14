import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widget/profile_app_bar.dart';
import '../widget/profile_login_button.dart';
import '../widget/profile_register_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.shade400,
        image: DecorationImage(
          image: const AssetImage("assets/signin.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.green.withOpacity(0.7),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: profileAppBar(context),
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: _buildTop(),
            ),
            Positioned(
              bottom: 0,
              child: _buildBottom(context),
            ),
          ],
        ),
      ),
    );
  }

  _buildTop() {
    return const Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.wallpaper,
            color: Colors.white,
            size: 50,
          ),
          Text(
            "Vibrant Vision",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  _buildBottom(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8.0,
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create an account",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Text(
              "Please login with your information",
            ),
            const ProfileRegisterForm(),
            _buildSocialLogin(),
          ],
        ),
      ),
    );
  }

  _buildSocialLogin() {
    return Center(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(),
          ),
          ProfileLoginButton(
            onPressed: () {
              Fluttertoast.showToast(msg: 'Not available');
            },
            btnText: 'Google',
            icon: const FaIcon(FontAwesomeIcons.google),
          ),
        ],
      ),
    );
  }
}

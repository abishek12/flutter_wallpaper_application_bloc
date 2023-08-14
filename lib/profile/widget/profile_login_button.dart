import 'package:flutter/material.dart';

class ProfileLoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnText;
  final Widget icon;
  const ProfileLoginButton({
    super.key,
    required this.onPressed,
    required this.btnText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text('Continue with $btnText'),
    );
  }
}

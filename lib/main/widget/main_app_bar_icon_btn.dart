import 'package:flutter/material.dart';

class MainAppBarIconBtn extends StatelessWidget {
  final Widget iconData;
  final VoidCallback onPressed;
  const MainAppBarIconBtn({
    super.key,
    required this.iconData,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: iconData,
      onPressed: onPressed,
    );
  }
}

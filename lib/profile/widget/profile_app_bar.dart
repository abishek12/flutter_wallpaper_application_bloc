import 'package:flutter/material.dart';

PreferredSizeWidget profileAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    actions: [
      IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    ],
  );
}

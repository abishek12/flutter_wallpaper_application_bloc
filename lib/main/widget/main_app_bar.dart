import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_application/main/widget/main_app_bar_icon_btn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../profile/view/auth_screen.dart';
import '../../search/view/search_screen.dart';

PreferredSizeWidget mainAppBar(
  BuildContext context, {
  String? title,
  bool? isSearchPage = false,
}) {
  return AppBar(
    title: Text(title ?? "Wallpaper"),
    leading: MainAppBarIconBtn(
      iconData: const FaIcon(FontAwesomeIcons.circleUser),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AuthScreen(),
        ),
      ),
    ),
    actions: [
      isSearchPage!
          ? MainAppBarIconBtn(
              iconData: const FaIcon(FontAwesomeIcons.circleXmark),
              onPressed: () => Navigator.pop(context),
            )
          : MainAppBarIconBtn(
              iconData: const FaIcon(FontAwesomeIcons.magnifyingGlass),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              ),
            ),
    ],
  );
}

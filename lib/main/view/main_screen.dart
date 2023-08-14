import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

import '../../photos/views/photo_screen.dart';
import '../widget/main_app_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      upgrader: Upgrader(
        shouldPopScope: () => true, canDismissDialog: true,
        //durationUntilAlertAgain: const Duration(days: 1),
      ),
      child: Scaffold(
        appBar: mainAppBar(context),
        body: const PhotoScreen(),
      ),
    );
  }
}

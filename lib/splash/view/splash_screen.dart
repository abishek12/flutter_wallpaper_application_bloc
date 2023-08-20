import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_wallpaper_application/onboarding/view/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main/view/main_screen.dart';
import '../cubit/splash_cubit.dart';
import 'splash_ui.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> checkOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    final bool value = prefs.getBool('showHome') ?? false;
    return value;
  }

  @override
  Widget build(BuildContext context) {
    final splashScreenCubit = context.watch<SplashCubit>();
    return BlocBuilder<SplashCubit, SplashScreenStatus>(
      builder: (context, status) {
        if (status == SplashScreenStatus.visible) {
          Future.delayed(const Duration(seconds: 3), () {
            splashScreenCubit.hideSplashScreen();
          });
        }
        return FutureBuilder<bool>(
          future: checkOnboarding(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (status == SplashScreenStatus.visible) {
              return const SplashUi();
            } else {
              return snapshot.data == false
                  ? const OnboardingScreen()
                  : const MainScreen();
            }
          },
        );
      },
    );
  }
}

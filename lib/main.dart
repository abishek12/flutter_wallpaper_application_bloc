import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'category/bloc/category_bloc.dart';
import 'photos/bloc/photos_bloc.dart';
import 'profile/bloc/login_bloc/login_bloc.dart';
import 'profile/bloc/register_bloc/register_bloc.dart';
import 'search/bloc/search_bloc.dart';
import 'splash/cubit/splash_cubit.dart';
import 'splash/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: ".env");
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PhotosBloc(),
        ),
        BlocProvider(
          create: (_) => LoginBloc(),
        ),
        BlocProvider(
          create: (_) => RegisterBloc(),
        ),
        BlocProvider(
          create: (_) => CategoryBloc(),
        ),
        BlocProvider(
          create: (_) => SearchBloc(),
        ),
        BlocProvider(
          create: (_) => SplashCubit(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

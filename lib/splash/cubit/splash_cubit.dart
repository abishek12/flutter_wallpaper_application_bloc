import 'package:flutter_bloc/flutter_bloc.dart';

enum SplashScreenStatus { visible, hidden }

class SplashCubit extends Cubit<SplashScreenStatus> {
  SplashCubit() : super(SplashScreenStatus.visible);

  void hideSplashScreen() {
    emit(SplashScreenStatus.hidden);
  }
}

import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/splash_screen/presentation/cubit/splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenInitial());
}

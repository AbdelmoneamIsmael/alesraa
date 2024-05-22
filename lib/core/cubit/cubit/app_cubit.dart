import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/cubit/cubit/app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
}

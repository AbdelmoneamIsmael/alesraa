import 'package:bloc/bloc.dart';

part 'introduction_screen_state.dart';

class IntroductionScreenCubit extends Cubit<IntroductionScreenState> {
  IntroductionScreenCubit() : super(IntroductionScreenInitial());
}

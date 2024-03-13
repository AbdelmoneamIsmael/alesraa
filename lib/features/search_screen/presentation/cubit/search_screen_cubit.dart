import 'package:bloc/bloc.dart';

part 'search_screen_state.dart';

class SearchScreenCubit extends Cubit<SearchScreenState> {
  SearchScreenCubit() : super(SearchScreenInitial());
  bool isHighToLow = false;
  bool isLowtoHigh = true;
  void changeHighToLowValue() {
    isHighToLow = !isHighToLow;
    isLowtoHigh = !isLowtoHigh;
    emit(ChangeHighToLowState());
  }

  //a-z
  bool isAToZ = true;
  bool isZtoA = false;
  void changeAToZValue() {
    isAToZ = !isAToZ;
    isZtoA = !isZtoA;
    emit(ChangeHighToLowState());
  }
}

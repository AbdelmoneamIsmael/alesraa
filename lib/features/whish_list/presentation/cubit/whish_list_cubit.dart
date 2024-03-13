import 'package:bloc/bloc.dart';

part 'whish_list_state.dart';

class WhishListCubit extends Cubit<WhishListState> {
  WhishListCubit() : super(WhishListInitial());
}

import 'package:bloc/bloc.dart';

part 'category_screen_state.dart';

class CategoryScreenCubit extends Cubit<CategoryScreenState> {
  CategoryScreenCubit() : super(CategoryScreenInitial());
}

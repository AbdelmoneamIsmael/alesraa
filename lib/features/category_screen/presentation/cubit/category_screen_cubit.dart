import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/models/category_model.dart';
import 'package:e_commerce/features/category_screen/domain/repositories/category_page_repo.dart';

part 'category_screen_state.dart';

class CategoryScreenCubit extends Cubit<CategoryScreenState> {
  CategoryScreenCubit({required this.categoryPageRepo})
      : super(CategoryScreenInitial());
  final CategoryPageRepo categoryPageRepo;
  StreamSubscription? getCategoriesStream;
  @override
  Future<void> close() {
    if (getCategoriesStream != null) {
      getCategoriesStream!.cancel();
    }
    return super.close();
  }

  Future<void> getCategories() async {
    emit(CategoryScreenLoading());
    var result = await categoryPageRepo.getCategories();
    result.fold((l) {
      emit(FailGetCategory());
    }, (r) {
      List<CategoryModel> categories = [];
      getCategoriesStream = r.listen((event) {
        categories = [];
        for (var element in event.docs) {
          categories.add(CategoryModel.fromJson(element.data()));
        }
        emit(SuccessGetCategory(categoriesModel: categories));
      });
    });
  }
}

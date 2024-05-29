part of 'category_screen_cubit.dart';

abstract class CategoryScreenState {}

class CategoryScreenInitial extends CategoryScreenState {}

class CategoryScreenLoading extends CategoryScreenState {}

class SuccessGetCategory extends CategoryScreenState {
  final List<CategoryModel> categoriesModel;

  SuccessGetCategory({required this.categoriesModel});
}

class FailGetCategory extends CategoryScreenState {}

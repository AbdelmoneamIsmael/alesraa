part of 'get_categories_cubit.dart';

sealed class GetCategoriesState {}

class GetCategoriesInitial extends GetCategoriesState {}

class LoadingGettingCategories extends GetCategoriesState {}

class SuccessGettingCategories extends GetCategoriesState {
  final List<HomeCategoryEntity> categories;

  SuccessGettingCategories({required this.categories});
}

class FailGettingCategories extends GetCategoriesState {
  final String error;
  FailGettingCategories({required this.error});
}

import 'package:e_commerce/features/add_product/data/models/category_model.dart';

abstract class SelectCategoryCubitState {}

final class SelectCategoryCubitInitial extends SelectCategoryCubitState {}

//Uploaded Product
class UploadedCategorySuccess extends SelectCategoryCubitState {}

class UploadedCategoryfail extends SelectCategoryCubitState {}

class GettingNewImage extends SelectCategoryCubitState {}

class GettingAllCategoies extends SelectCategoryCubitState {}

class FailedToGetData extends SelectCategoryCubitState {
  final String message;
  FailedToGetData({required this.message});
}

class SuccessToGetData extends SelectCategoryCubitState {
  final List<AddProductCategoryModel> categories;

  SuccessToGetData({required this.categories});
}

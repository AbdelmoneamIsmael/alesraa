part of 'products_related_to_category_cubit.dart';

abstract class ProductsRelatedToCategoryState {}

class ProductsRelatedToCategoryInitial extends ProductsRelatedToCategoryState {}

class GettingKinds extends ProductsRelatedToCategoryState {}

class SuccessToGetKinds extends ProductsRelatedToCategoryState {
  List<KindModel> kindModel;

  SuccessToGetKinds({required this.kindModel});
}

class FailToGetKinds extends ProductsRelatedToCategoryState {
  String message;

  FailToGetKinds({required this.message});
}

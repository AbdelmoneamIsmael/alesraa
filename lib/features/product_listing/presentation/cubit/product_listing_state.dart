part of 'product_listing_cubit.dart';

abstract class ProductListingState {}

class ProductListingInitial extends ProductListingState {}

class LoadingRelatedProducts extends ProductListingState {}

class SuccessRelatedProducts extends ProductListingState {
  List<ProductEntity> relatedProductsList;
  SuccessRelatedProducts({required this.relatedProductsList});
}

class FailureRelatedProducts extends ProductListingState {}

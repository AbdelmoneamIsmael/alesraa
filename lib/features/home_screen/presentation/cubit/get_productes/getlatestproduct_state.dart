part of 'getlatestproduct_cubit.dart';

@immutable
sealed class GetlatestproductState {}

final class GetlatestproductInitial extends GetlatestproductState {}

class LoadingGettingProducts extends GetlatestproductState {}

class SuccessGettingProducts extends GetlatestproductState {
  final List<HomeProductEntity> products;

  SuccessGettingProducts({required this.products});
}

class FailGettingProducts extends GetlatestproductState {
  final String error;
  FailGettingProducts({required this.error});
}

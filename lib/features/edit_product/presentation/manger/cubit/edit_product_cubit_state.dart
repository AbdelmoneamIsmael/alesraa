part of 'edit_product_cubit_cubit.dart';

sealed class EditProductCubitState {}

final class EditProductCubitInitial extends EditProductCubitState {}

final class ActiveLoadingState extends EditProductCubitState {}

final class DeActiveLoadingState extends EditProductCubitState {}

final class ProductSuccessDeleted extends EditProductCubitState {}

final class ProductSuccessUpdated extends EditProductCubitState {}

final class ProductFailDeleted extends EditProductCubitState {}

final class ProductFailUpdated extends EditProductCubitState {}

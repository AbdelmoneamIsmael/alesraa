part of 'create_product_cubit.dart';

@immutable
sealed class CreateProductState {}

final class CreateProductInitial extends CreateProductState {}

final class ConfirmTextState extends CreateProductState {}

final class ConfirmNumbersState extends CreateProductState {}

final class GettingNewImage extends CreateProductState {}

final class ActiveLoadingState extends CreateProductState {}

final class UploadedProductfail extends CreateProductState {}

final class DeActiveLoadingState extends CreateProductState {}

final class UploadedProductSuccess extends CreateProductState {}

part of 'add_product_cubit.dart';

abstract class AddProductState {}

class AddProductInitial extends AddProductState {}

class LoadingState extends AddProductState {}

class GetImage extends AddProductState {}

class ChangeButtonState extends AddProductState {}

class ChangePageState extends AddProductState {}

class ChangeItemTypeState extends AddProductState {}

//Uploaded Product
class UploadedCategorySuccess extends AddProductState {}

class UploadedCategoryfail extends AddProductState {}

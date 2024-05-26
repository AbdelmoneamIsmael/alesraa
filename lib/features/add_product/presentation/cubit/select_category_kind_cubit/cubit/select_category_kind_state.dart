part of 'select_category_kind_cubit.dart';

sealed class SelectCategoryKindState {}

final class SelectCategoryKindInitial extends SelectCategoryKindState {}

final class GettingNewImage extends SelectCategoryKindState {}

final class UploadedCategoryfail extends SelectCategoryKindState {}

final class UploadedCategorySuccess extends SelectCategoryKindState {}

final class ActiveLoadingState extends SelectCategoryKindState {}

final class DeActiveLoadingState extends SelectCategoryKindState {}

final class GettingAllCategoies extends SelectCategoryKindState {}

class FailedToGetData extends SelectCategoryKindState {
  final String message;
  FailedToGetData({required this.message});
}

class SuccessToGetData extends SelectCategoryKindState {
  final List<AddProductKindModel> kinds;

  SuccessToGetData({required this.kinds});
}

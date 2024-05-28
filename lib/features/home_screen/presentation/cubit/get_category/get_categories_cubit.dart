import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/helper/ui_helper.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:e_commerce/features/home_screen/domain/entities/category_entity.dart';
import 'package:e_commerce/features/home_screen/domain/repositories/home_repo.dart';
import 'package:flutter/material.dart';

part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit({required this.homeRepoDomain, required this.context})
      : super(GetCategoriesInitial());
  final HomeRepoDomain homeRepoDomain;
  final BuildContext context;
  void getCategories() async {
    emit(LoadingGettingCategories());
    var result = await homeRepoDomain.fetchCategories();
    result.fold(
      (l) {
        UiHelper.showSnakBar(
          context: context,
          message: l.message,
          iconPath: IconAssets.errorSnakIcon,
        );
        emit(FailGettingCategories(
          error: l.message,
        ));
      },
      (r) {
        emit(SuccessGettingCategories(
          categories: r,
        ));
      },
    );
  }
}

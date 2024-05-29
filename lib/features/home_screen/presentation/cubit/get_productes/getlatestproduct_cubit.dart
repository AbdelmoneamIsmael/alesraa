import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/helper/ui_helper.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:e_commerce/features/home_screen/data/models/home_product_model.dart';
import 'package:e_commerce/features/home_screen/domain/entities/product_entity.dart';
import 'package:e_commerce/features/home_screen/domain/repositories/home_repo.dart';
import 'package:flutter/material.dart';

part 'getlatestproduct_state.dart';

class GetlatestproductCubit extends Cubit<GetlatestproductState> {
  GetlatestproductCubit({required this.homeRepoDomain, required this.context})
      : super(GetlatestproductInitial());
  final HomeRepoDomain homeRepoDomain;
  final BuildContext context;
  StreamSubscription? latestProductStream;
  @override
  Future<void> close() {
    if (latestProductStream != null) {
      latestProductStream!.cancel();
    }

    return super.close();
  }

  void getLatestProducts() async {
    emit(LoadingGettingProducts());
    var result = await homeRepoDomain.fetchProducts();
    result.fold(
      (l) {
        UiHelper.showSnakBar(
          context: context,
          message: l.message,
          iconPath: IconAssets.errorSnakIcon,
        );
        emit(FailGettingProducts(
          error: l.message,
        ));
      },
      (r) {
        List<HomeProductEntity> products = [];
        latestProductStream = r.listen((event) {
          products = [];
          for (var element in event.docs) {
            products.add(HomeProductModel.fromJson(element.data()));
          }
          emit(SuccessGettingProducts(
            products: products,
          ));
        });
      },
    );
  }
}

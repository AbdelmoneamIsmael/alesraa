import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/helper/ui_helper.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:e_commerce/features/product_listing/domain/entities/product_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

part 'edit_product_cubit_state.dart';

class EditProductCubitCubit extends Cubit<EditProductCubitState> {
  EditProductCubitCubit(this.productEntity, this.context)
      : super(EditProductCubitInitial());
  final ProductEntity productEntity;
  final BuildContext context;
  TextEditingController describeController = TextEditingController();
  TextEditingController mainPriceController = TextEditingController();
  TextEditingController sellPriceController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  @override
  Future<void> close() {
    describeController.dispose();
    amountController.dispose();
    mainPriceController.dispose();
    sellPriceController.dispose();
    return super.close();
  }

  void init() {
    describeController.text = productEntity.pDescribtion;
    amountController.text = productEntity.pAmount.toString();
    mainPriceController.text = productEntity.pmainPrice.toString();
    sellPriceController.text = productEntity.pPrice.toString();
  }

  void deleteProduct() {
    emit(ActiveLoadingState());
    try {
      productEntity.pReferance!.get().then((value) {
        if (value.exists) {
          value.reference.delete().then((value) {
            UiHelper.showSnakBar(
              context: context,
              message: "تم حذف المنتج",
              iconPath: IconAssets.successSnackIcon,
            );
            emit(ProductSuccessDeleted());
            GoRouter.of(context).pop();
            GoRouter.of(context).pop();
          });
        } else {
          UiHelper.showSnakBar(
            context: context,
            message: "المنتج اصبح غير موجود او تم حذفة من قبل",
            iconPath: IconAssets.errorSnakIcon,
          );

          emit(DeActiveLoadingState());
        }
      });
    } catch (e) {
      UiHelper.showSnakBar(
        context: context,
        message: "حدث خطأ ما",
        iconPath: IconAssets.errorSnakIcon,
      );
      emit(DeActiveLoadingState());
    }
  }

  void updateProduct() {
    emit(ActiveLoadingState());
    if (num.parse(mainPriceController.text) <
        num.parse(sellPriceController.text)) {
      try {
        productEntity.pReferance!.update({
          "details": describeController.text,
          "main_price": num.parse(mainPriceController.text),
          "sell_Price": num.parse(sellPriceController.text),
          "amount": num.parse(amountController.text),
          "updatedAt": Timestamp.now(),
        }).then((value) {
          UiHelper.showSnakBar(
            context: context,
            message: "تم تعديل المنتج",
            iconPath: IconAssets.successSnackIcon,
          );
          emit(DeActiveLoadingState());
          GoRouter.of(context).pop();
          GoRouter.of(context).pop();
        });
      } catch (e) {
        UiHelper.showSnakBar(
          context: context,
          message: "حدث خطأ ما",
          iconPath: IconAssets.errorSnakIcon,
        );
        emit(DeActiveLoadingState());
      }
    } else {
      UiHelper.showSnakBar(
        context: context,
        message: "سعر البيع يجب ان يكون اكبر من سعر الشراء",
        iconPath: IconAssets.infoSnackIcon,
      );
      emit(DeActiveLoadingState());
    }
  }
}

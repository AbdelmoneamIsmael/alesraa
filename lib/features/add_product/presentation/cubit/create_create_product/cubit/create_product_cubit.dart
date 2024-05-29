import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/firebase_services/firebase_services.dart';
import 'package:e_commerce/core/helper/get_image_mixin.dart';
import 'package:e_commerce/core/helper/ui_helper.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/features/add_product/data/datasources/remote/add_product.dart';
import 'package:e_commerce/features/add_product/data/models/category_model.dart';
import 'package:e_commerce/features/add_product/data/models/kind_model.dart';
import 'package:e_commerce/features/add_product/data/models/product_model.dart';
import 'package:e_commerce/features/add_product/data/repositories/add_product_repo.dart';
import 'package:e_commerce/features/add_product/domain/usecases/add_product_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

part 'create_product_state.dart';

class CreateProductCubit extends Cubit<CreateProductState> with ImageMixin {
  CreateProductCubit() : super(CreateProductInitial());
  late AddProductKindModel kindModel;
  late AddProductCategoryModel categoryModel;
  AddProductModel productModel = AddProductModel.empty();
  @override
  Future<void> close() {
    productName.dispose();
    productcode.dispose();
    productDetails.dispose();
    productAmount.dispose();
    productRate.dispose();
    productMainPrice.dispose();
    productSellPrice.dispose();
    return super.close();
  }

  //variable
  GlobalKey<FormState> productTextFormKey = GlobalKey<FormState>();
  TextEditingController productName = TextEditingController();
  TextEditingController productcode = TextEditingController();
  TextEditingController productDetails = TextEditingController();

  void confirmText(BuildContext context) {
    if (productTextFormKey.currentState!.validate()) {
      productModel.name = productName.text;
      productModel.code = productcode.text;
      productModel.details = productDetails.text;
      productModel.kindReferance = kindModel.kindReferance;
      productModel.categoryReferance = categoryModel.categoryReferance;
      productModel.kindName = kindModel.name;
      productModel.categoryName = categoryModel.name;
      productModel.productReferance =
          FireBaseServices.productsCall.doc(productModel.productId);
      emit(ConfirmTextState());
      GoRouter.of(context).push(
        Routes.createProductNumber,
      );
    }
  }

  //product numbers

  TextEditingController productAmount = TextEditingController();
  TextEditingController productRate = TextEditingController();
  TextEditingController productMainPrice = TextEditingController();
  TextEditingController productSellPrice = TextEditingController();
  GlobalKey<FormState> numbersFormKey = GlobalKey<FormState>();
  void confirmNumbers(BuildContext context) {
    if (numbersFormKey.currentState!.validate()) {
      productModel.amount = num.parse(productAmount.text);
      productModel.raiting = num.parse(productRate.text);
      productModel.mainPrice = num.parse(productMainPrice.text);
      productModel.sellPrice = num.parse(productSellPrice.text);
      if (productModel.mainPrice! < productModel.sellPrice! &&
          productModel.raiting! <= 5) {
        emit(ConfirmNumbersState());
        GoRouter.of(context).push(
          Routes.createProductImage,
        );
      } else {
        productModel.mainPrice! >= productModel.sellPrice!
            ? UiHelper.showSnakBar(
                context: context,
                message: "ينبغي ان يكون سعر البيع اعلي من سعر الاساسي",
                iconPath: IconAssets.infoSnackIcon)
            : productModel.raiting! > 5
                ? UiHelper.showSnakBar(
                    context: context,
                    message: "الحد الاقصي للتقيم هو 5",
                    iconPath: IconAssets.infoSnackIcon)
                : 1;
      }
    }
  }

  //for image
  File? productImage;
  Future<void> addPhoto(BuildContext context) async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                super.getGalleryImage().then((value) {
                  productImage = value;
                  Navigator.pop(context);
                  emit(GettingNewImage());
                });
              },
              child: const Text('Gallery Image'),
            ),
            CupertinoActionSheetAction(
              onPressed: () async {
                super.getCameraImage().then((value) {
                  productImage = value;
                  Navigator.pop(context);
                  emit(GettingNewCameraImage());
                });
              },
              child: const Text('Camera Image'),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        );
      },
    );
  }

  Future<void> uploadeProduct(
    BuildContext context,
  ) async {
    if (productImage == null) {
      UiHelper.showSnakBar(
          context: context,
          message: "من فضلك اختر صورة لهذا المنتج",
          iconPath: IconAssets.errorSnakIcon);
    } else {
      activeLoadingState();
      var result = await UploadeProductUseCase(
        addProductRepo: AddProductRepoImpl(
          uploadeProduct: UploadeProduct(),
        ),
      ).call(productModel, productImage);

      result.fold((l) {
        deActiveLoadingState();
        emit(UploadedProductfail());
        UiHelper.showSnakBar(
            context: context,
            message: "حدث خطأ ما اثناء رفع الصورة",
            iconPath: IconAssets.errorSnakIcon);
      }, (r) {
        if (r == false) {
          emit(UploadedProductfail());
          deActiveLoadingState();
          UiHelper.showSnakBar(
            context: context,
            message: "لا يمكن تكرار الاسم انه موجود بالفعل",
            iconPath: IconAssets.errorSnakIcon,
          );
          PrinterHelper("can't uploade there is the same name in category");
        } else {
          emit(UploadedProductSuccess());
          deActiveLoadingState();
          UiHelper.showSnakBar(
              context: context,
              message: "تم انشاء هذا المنتج بنجاح",
              iconPath: IconAssets.successSnackIcon);
          GoRouter.of(context).pop();
          GoRouter.of(context).pop();
          GoRouter.of(context).pop();
          GoRouter.of(context).pop();
          GoRouter.of(context).pop();
          PrinterHelper('uploaded');
        }
      });
    }
  }

  activeLoadingState() {
    emit(ActiveLoadingState());
  }

  deActiveLoadingState() {
    emit(DeActiveLoadingState());
  }
}

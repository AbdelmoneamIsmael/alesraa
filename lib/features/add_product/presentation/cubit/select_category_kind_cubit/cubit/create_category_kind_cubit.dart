import 'dart:io';

import 'package:e_commerce/core/firebase_services/firebase_services.dart';
import 'package:e_commerce/core/helper/get_image_mixin.dart';
import 'package:e_commerce/core/helper/ui_helper.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:e_commerce/core/routes/routers.dart';
import 'package:e_commerce/features/add_product/data/datasources/remote/add_product.dart';
import 'package:e_commerce/features/add_product/data/models/category_model.dart';
import 'package:e_commerce/features/add_product/data/models/kind_model.dart';
import 'package:e_commerce/features/add_product/data/repositories/add_product_repo.dart';
import 'package:e_commerce/features/add_product/domain/usecases/add_product_kind_use_case.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/select_category_kind_cubit/cubit/select_category_kind_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CreateNewCategoryKindCubit extends Cubit<SelectCategoryKindState>
    with ImageMixin {
  CreateNewCategoryKindCubit({
    required this.categoryModel,
    required this.context,
  }) : super(SelectCategoryKindInitial());
  BuildContext context;
  final AddProductCategoryModel categoryModel;
  File? kindeFile;
  AddProductKindModel? kindModel;
  String? selectedImageName;
  TextEditingController kindName = TextEditingController();
  Future<void> addPhoto() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                super.getGalleryImage().then((value) {
                  kindeFile = value;
                  Navigator.pop(context);
                  emit(GettingNewImage());
                });
              },
              child: const Text('Gallery Image'),
            ),
            CupertinoActionSheetAction(
              onPressed: () async {
                super.getCameraImage().then((value) {
                  kindeFile = value;
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

  Future<void> confirmButtom() async {
    if (kindeFile == null) {
      UiHelper.showSnakBar(
          context: context,
          message: "من فضلك اختر صورة لهذا النوع",
          iconPath: IconAssets.errorSnakIcon);
    } else {
      if (kindName.text.isEmpty) {
        UiHelper.showSnakBar(
            context: context,
            message: "من فضلك ادخل اسم النوع",
            iconPath: IconAssets.infoSnackIcon);
      } else {
        activeLoadingState();

        String kindId = FireBaseServices.generateID();
        var kindReferance = FireBaseServices.categoryCall
            .doc(categoryModel.categoryReferance!.id)
            .collection("kinds")
            .doc(kindModel?.kindId);
        kindModel = AddProductKindModel(
          kindId: kindId,
          kindReferance: kindReferance,
          categoryReferance: categoryModel.categoryReferance,
          image: "r",
          name: kindName.text,
        );

        var result = await UploadeKindUseCase(
                addProductRepo:
                    AddProductRepoImpl(uploadeProduct: UploadeProduct()))
            .call(kindModel!, kindeFile);

        result.fold((l) {
          deActiveLoadingState();
          emit(UploadedCategoryfail());
          UiHelper.showSnakBar(
              context: context,
              message: "حدث خطأ ما اثناء رفع الصورة",
              iconPath: IconAssets.errorSnakIcon);
        }, (r) {
          if (r == false) {
            emit(UploadedCategoryfail());
            deActiveLoadingState();
            UiHelper.showSnakBar(
              context: context,
              message: "لا يمكن تكرار الاسم انه موجود بالفعل",
              iconPath: IconAssets.errorSnakIcon,
            );
            PrinterHelper("can't uploade there is the same name in category");
          } else {
            emit(UploadedCategorySuccess());
            deActiveLoadingState();
            UiHelper.showSnakBar(
                context: context,
                message: "تم انشاء هذا النوع بنجاح",
                iconPath: IconAssets.successSnackIcon);
            GoRouter.of(context).push(PageRoutes.createProductTexts, extra: {
              "categoryModel": categoryModel,
              "kindModel": kindModel,
            });
            PrinterHelper('uploaded');
          }
        });
      }
    }
  }

  activeLoadingState() {
    emit(ActiveLoadingState());
  }

  deActiveLoadingState() {
    emit(DeActiveLoadingState());
  }
}

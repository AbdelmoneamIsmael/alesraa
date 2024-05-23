import 'dart:io';

import 'package:e_commerce/core/firebase_services/firebase_services.dart';
import 'package:e_commerce/core/helper/get_image_mixin.dart';
import 'package:e_commerce/core/helper/ui_helper.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:e_commerce/features/add_product/data/datasources/remote/add_product.dart';
import 'package:e_commerce/features/add_product/data/models/category_model.dart';
import 'package:e_commerce/features/add_product/data/repositories/add_product_repo.dart';
import 'package:e_commerce/features/add_product/domain/usecases/add_product_use_case.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/select_category_cubit/cubit/select_category_cubit_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNewCategoryCubit extends Cubit<SelectCategoryCubitState>
    with ImageMixin {
  CreateNewCategoryCubit({required this.context})
      : super(SelectCategoryCubitInitial());
  BuildContext context;

  File? categoryTypeFile;
  AddProductCategoryModel? categoryModel;
  String? selectedImageName;
  TextEditingController categoryName = TextEditingController();
  Future<void> addPhoto() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                super.getGalleryImage().then((value) {
                  categoryTypeFile = value;
                  Navigator.pop(context);
                  emit(GettingNewImage());
                });
              },
              child: const Text('Gallery Image'),
            ),
            CupertinoActionSheetAction(
              onPressed: () async {
                super.getCameraImage().then((value) {
                  categoryTypeFile = value;
                  Navigator.pop(context);
                  emit(GettingNewImage());
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
    if (categoryTypeFile == null) {
      UiHelper.showSnakBar(
          message: "من فضلك اختر صورة لهذا النوع",
          iconPath: IconAssets.errorSnakIcon);
    } else {
      if (categoryName.text.isEmpty) {
        UiHelper.showSnakBar(
            message: "من فضلك ادخل اسم النوع",
            iconPath: IconAssets.infoSnackIcon);
      } else {
        BlocProvider.of<AddProductCubit>(context).activeLoadingState();

        String categoryId = FireBaseServices.generateID();
        var categoryReferance = FireBaseServices.categoryCall.doc(categoryId);
        categoryModel = AddProductCategoryModel(
          categoryId: categoryId,
          categoryReferance: categoryReferance,
          image: "r",
          name: categoryName.text,
        );

        var result = await UploadeCategoryUseCase(
                addProductRepo:
                    AddProductRepoImpl(uploadeProduct: UploadeProduct()))
            .call(categoryModel!, categoryTypeFile);

        result.fold((l) {
          BlocProvider.of<AddProductCubit>(context).deActiveLoadingState();
          emit(UploadedCategoryfail());
          UiHelper.showSnakBar(
              message: "حدث خطأ ما اثناء رفع الصورة",
              iconPath: IconAssets.errorSnakIcon);
        }, (r) {
          if (r == false) {
            emit(UploadedCategoryfail());
            BlocProvider.of<AddProductCubit>(context).deActiveLoadingState();
            UiHelper.showSnakBar(
                message: "لا يمكن تكرار الاسم انه موجود بالفعل",
                iconPath: IconAssets.errorSnakIcon);
            PrinterHelper("can't uploade there is the same name in category");
          } else {
            emit(UploadedCategorySuccess());
            BlocProvider.of<AddProductCubit>(context).deActiveLoadingState();
            UiHelper.showSnakBar(
                message: "تم انشاء هذا النوع بنجاح",
                iconPath: IconAssets.successSnackIcon);
            PrinterHelper('uploaded');
          }
        });
      }
    }
  }
}

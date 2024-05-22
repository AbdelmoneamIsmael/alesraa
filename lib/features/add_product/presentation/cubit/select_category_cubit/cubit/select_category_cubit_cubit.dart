import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/firebase_services/firebase_services.dart';
import 'package:e_commerce/core/helper/get_image_mixin.dart';
import 'package:e_commerce/core/helper/ui_helper.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:e_commerce/features/add_product/data/datasources/remote_data_source.dart';
import 'package:e_commerce/features/add_product/data/models/category_model.dart';
import 'package:e_commerce/features/add_product/data/repositories/add_product_repo.dart';
import 'package:e_commerce/features/add_product/domain/usecases/add_product_use_case.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/select_category_cubit/cubit/select_category_cubit_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectCategoryCubitCubit extends Cubit<SelectCategoryCubitState>
    with ImageMixin {
  SelectCategoryCubitCubit({required this.context})
      : super(SelectCategoryCubitInitial());
  BuildContext context;
  @override
  bool isNoPhoto = true;
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
              onPressed: () async {
                categoryTypeFile = await super.getGalleryImage();
                Navigator.pop(context);
              },
              child: const Text('Gallery Image'),
            ),
            CupertinoActionSheetAction(
              onPressed: () async {
                categoryTypeFile = await super.getCameraImage();
                Navigator.pop(context);
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
          context: context,
          message: "من فضلك اختر صورة لهذا النوع",
          iconPath: IconAssets.errorSnakIcon);
    } else {
      if (categoryName.text.isEmpty) {
        UiHelper.showSnakBar(
            context: context,
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
          emit(UploadedCategoryfail());
          UiHelper.showSnakBar(
              context: context,
              message: "حدث خطأ ما اثناء رفع الصورة",
              iconPath: IconAssets.errorSnakIcon);
        }, (r) {
          if (r == false) {
            emit(UploadedCategoryfail());
            UiHelper.showSnakBar(
                context: context,
                message: "لا يمكن تكرار الاسم انه موجود بالفعل",
                iconPath: IconAssets.errorSnakIcon);
            PrinterHelper("can't uploade there is the same name in category");
          } else {
            emit(UploadedCategorySuccess());
            UiHelper.showSnakBar(
                context: context,
                message: "تم انشاء هذا النوع بنجاح",
                iconPath: IconAssets.successSnackIcon);
            PrinterHelper('uploaded');
          }
        });
      }
    }
  }
}

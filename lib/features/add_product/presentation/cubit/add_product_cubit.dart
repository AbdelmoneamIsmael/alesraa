import 'dart:io';
import 'package:e_commerce/core/firebase_services/firebase_services.dart';
import 'package:e_commerce/core/helper/ui_helper.dart';
import 'package:e_commerce/core/routes/routers.dart';
import 'package:e_commerce/features/add_product/data/datasources/remote_data_source.dart';
import 'package:e_commerce/features/add_product/data/models/category_model.dart';
import 'package:e_commerce/features/add_product/data/models/kind_model.dart';
import 'package:e_commerce/features/add_product/data/models/product_model.dart';
import 'package:e_commerce/features/add_product/data/repositories/add_product_repo.dart';
import 'package:e_commerce/features/add_product/presentation/pages/add_broduct_image.dart';
import 'package:e_commerce/features/add_product/presentation/pages/add_category_kind.dart';
import 'package:e_commerce/features/add_product/presentation/pages/add_category_type.dart';
import 'package:e_commerce/features/add_product/presentation/pages/add_product_numbers.dart';
import 'package:e_commerce/features/add_product/presentation/pages/add_product_text.dart';
import 'package:e_commerce/features/add_product/presentation/pages/final_review.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());

  TextEditingController typeName = TextEditingController();
  TextEditingController productName = TextEditingController();
  TextEditingController productcode = TextEditingController();
  TextEditingController productDetails = TextEditingController();
  TextEditingController productRate = TextEditingController();
  TextEditingController productAmount = TextEditingController();
  TextEditingController productMainPrice = TextEditingController();
  TextEditingController productSellPrice = TextEditingController();
  TextEditingController kindName = TextEditingController();
  int? selectedType;
  int? selectedKind;
  bool newCategory = false;
  bool newCategoryKind = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> kindFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> productTextFormKey = GlobalKey<FormState>();
  AddProductCategoryModel? categoryModel;
  AddProductProductModel? productModel;
  AddProductKindModel? kindModel;
  int pageNumber = 0;
  List<Widget> page = [
    const CategoryType(),
    const CategoryKind(),
    const ProductText(),
    const ProductNumbers(),
    const ProductImage(),
    const FinalReview(),
  ];
  ////////////////////////////////for image/////////////////////////
  bool isNoPhoto = true;
  bool isNoKindPhoto = true;
  bool isNoProductPhoto = true;
  final imagePicker = ImagePicker();
  late File categoryTypeFile;
  late File categoryKindFile;
  late File productImageFile;

  String? selectedImageName;
  Future<void> addPhoto(BuildContext context, int page) async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                _getGalleryImage(page);
                Navigator.pop(context);
              },
              child: const Text('Gallery Image'),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                _getCameraImage(page);
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

  Future _getGalleryImage(int page) async {
    imagePicker
        .pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxHeight: 500,
      maxWidth: 500,
    )
        .then((value) async {
      if (value != null) {
        page == 0
            ? categoryTypeFile = File(value.path)
            : page == 1
                ? categoryKindFile = File(value.path)
                : productImageFile = File(value.path);

        page == 0
            ? isNoPhoto = false
            : page == 1
                ? isNoKindPhoto = false
                : isNoProductPhoto = false;

        page == 0
            ? categoryTypeFile = await compress(image: categoryTypeFile)
            : page == 1
                ? categoryKindFile = await compress(image: categoryKindFile)
                : productImageFile = await compress(
                    image: productImageFile, quality: 400, percentage: 90);
        selectedImageName = path.basename(categoryTypeFile.path);
        emit(GetImage());
      } else {
        selectedImageName = '';
      }
    });
  }

  Future _getCameraImage(int page) async {
    imagePicker
        .pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
      maxHeight: 500,
      maxWidth: 500,
    )
        .then((value) async {
      if (value != null) {
        page == 0
            ? categoryTypeFile = File(value.path)
            : page == 1
                ? categoryKindFile = File(value.path)
                : productImageFile = File(value.path);

        emit(GetImage());
        page == 0
            ? isNoPhoto = false
            : page == 1
                ? isNoKindPhoto = false
                : isNoProductPhoto = false;

        page == 0
            ? categoryTypeFile = await compress(image: categoryTypeFile)
            : page == 1
                ? categoryKindFile = await compress(image: categoryKindFile)
                : productImageFile = await compress(
                    image: productImageFile, quality: 400, percentage: 90);

        selectedImageName = 'captured-image.jpg';
      } else {
        selectedImageName = '';
      }
    });
  }

  Future<File> compress({
    required File image,
    int quality = 100,
    int percentage = 70,
  }) async {
    final path = await FlutterNativeImage.compressImage(
      image.absolute.path,
      quality: quality,
      percentage: percentage,
    );

    return path;
  }

// //upload
//   RxBool isUploadingPhoto = false.obs;
//   Future<String> imageToFirebase() async {
//     isUploadingPhoto.value = true;

//     final snap = await FirebaseStorage.instance
//         .ref()
//         .child('todo/${Uri.file(image.path).pathSegments.last}')
//         .putFile(image);

//     final value = await snap.ref.getDownloadURL();
//     isUploadingPhoto.value = false;
//     return value;
//   }
  ////////////////////////////////for image/////////////////////////
  void changeSelection(index) {
    selectedType = index;
    emit(ChangeItemTypeState());
  }

  void changeKindSelection(index) {
    selectedKind = index;
    emit(ChangeItemTypeState());
  }

  Future<void> changeCurrentPage(
      {required bool isNext, required BuildContext context}) async {
    switch (pageNumber) {
      case 0:
        if (newCategory) {
          emit(LoadingState());
          String categoryId = FireBaseServices.generateID();
          var categoryReferance = FireBaseServices.categoryCall.doc(categoryId);
          categoryModel = AddProductCategoryModel(
            categoryId: categoryId,
            categoryReferance: categoryReferance,
            image: "xdd",
            name: typeName.text,
          );
          var result =
              await AddProductRepoImpl(uploadeProduct: UploadeProduct())
                  .addCategory(categoryModel!);
          result.fold((l) {
            emit(UploadedCategoryfail());
            PrinterHelper(l.message);
          }, (r) {
            emit(UploadedCategorySuccess());
            PrinterHelper('uploaded');
          });
        } else {
          PrinterHelper('no new category');
          emit(UploadedCategoryfail());
        }
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;

      default:
        break;
    }
    // swapPage(isNext, context);
  }

  void swapPage(bool isNext, BuildContext context) {
    isNext
        ? pageNumber + 1 < page.length
            ? pageNumber++
            : GoRouter.of(context).pushReplacement(PageRoutes.mainScreen)
        : pageNumber == 0
            ? GoRouter.of(context).pop()
            : pageNumber--;
    emit(ChangeItemTypeState());
  }

  bool cheekAviability() {
    emit(ChangeButtonState());
    if (pageNumber == 0) {
      if (selectedType != null || newCategory == true) {
        if (newCategory) {
          if (formKey.currentState!.validate()) {
            emit(ChangeButtonState());
            return true;
          } else {
            emit(ChangeButtonState());
            return false;
          }
        } else {
          emit(ChangeButtonState());
          return true;
        }
      } else {
        emit(ChangeButtonState());
        return false;
      }
    } else if (pageNumber == 1) {
      if (selectedKind != null || newCategoryKind == true) {
        if (newCategoryKind) {
          if (kindFormKey.currentState!.validate()) {
            emit(ChangeButtonState());
            return true;
          } else {
            emit(ChangeButtonState());
            return false;
          }
        } else {
          emit(ChangeButtonState());
          return true;
        }
      } else {
        emit(ChangeButtonState());
        return false;
      }
    } else if (pageNumber == 2) {
      if (productDetails.text.isNotEmpty && productName.text.isNotEmpty) {
        emit(ChangeButtonState());
        return true;
      } else {
        emit(ChangeButtonState());
        return false;
      }
    } else if (pageNumber == 3) {
      if (productAmount.text.isNotEmpty &&
          productRate.text.isNotEmpty &&
          productMainPrice.text.isNotEmpty &&
          productSellPrice.text.isNotEmpty &&
          int.parse(productAmount.text) > 0 &&
          0 < double.parse(productRate.text) &&
          double.parse(productRate.text) <= 5 &&
          0 < double.parse(productMainPrice.text) &&
          double.parse(productMainPrice.text) <
              double.parse(productSellPrice.text)) {
        emit(ChangeButtonState());
        return true;
      } else {
        emit(ChangeButtonState());
        return false;
      }
    } else if (pageNumber == 4) {
      if (isNoProductPhoto) {
        emit(ChangeButtonState());
        return false;
      } else {
        emit(ChangeButtonState());
        return true;
      }
    } else if (pageNumber == 5) {
      emit(ChangeButtonState());
      return true;
    } else {
      emit(ChangeButtonState());
      return false;
    }
  }
}

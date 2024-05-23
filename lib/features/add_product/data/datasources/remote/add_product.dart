import 'dart:io';

import 'package:e_commerce/core/firebase_services/firebase_services.dart';
import 'package:e_commerce/features/add_product/data/models/category_model.dart';
import 'package:e_commerce/features/add_product/data/models/kind_model.dart';
import 'package:e_commerce/features/add_product/data/models/product_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class AddProductToDBRepo {
  Future<void> addCategory(AddProductCategoryModel model);
  Future<void> addKind(AddProductKindModel model);
  Future<void> addProduct(AddProductProductModel model);
  Future<String> uploadImage(File image);
  Future<bool> cheekTheNameExesistInProduct(String name);
  Future<bool> cheekTheNameExesistInKind(String name);
  Future<bool> cheekTheNameExesistInCategory(String name);
}

class UploadeProduct extends AddProductToDBRepo {
  @override
  Future<void> addCategory(AddProductCategoryModel model) async {
    return await FireBaseServices.categoryCall
        .doc(model.categoryId!)
        .set(model.toJson());
  }

  @override
  Future<void> addKind(AddProductKindModel model) async {
    model.kindReferance = FireBaseServices.categoryCall
        .doc(model.categoryReferance!.id)
        .collection("kinds")
        .doc(model.kindId!);
    return await FireBaseServices.categoryCall
        .doc(model.categoryReferance!.id)
        .collection("kinds")
        .doc(model.kindId!)
        .set(model.toJson());
  }

  @override
  Future<void> addProduct(AddProductProductModel model) async {
    model.productId = FireBaseServices.generateID();
    model.productReferance =
        FireBaseServices.productsCall.doc(model.productId!);
    return await FireBaseServices.productsCall
        .doc(model.productId!)
        .set(model.toJson());
  }

  @override
  Future<String> uploadImage(File image) async {
    final snapShot = await FirebaseStorage.instance
        .ref()
        .child("/image/${Uri.file(image.path).pathSegments.last}")
        .putFile(image);
    return await snapShot.ref.getDownloadURL();
  }

  @override
  Future<bool> cheekTheNameExesistInCategory(String name) async {
    var result = await FireBaseServices.categoryCall
        .where("name", isEqualTo: name)
        .get();
    if (result.docs.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<bool> cheekTheNameExesistInKind(String name) {
    // TODO: implement cheekTheNameExesistInKind
    throw UnimplementedError();
  }

  @override
  Future<bool> cheekTheNameExesistInProduct(String name) {
    // TODO: implement cheekTheNameExesistInProduct
    throw UnimplementedError();
  }
}

import 'package:e_commerce/core/firebase_services/firebase_services.dart';
import 'package:e_commerce/features/add_product/data/models/category_model.dart';
import 'package:e_commerce/features/add_product/data/models/kind_model.dart';
import 'package:e_commerce/features/add_product/data/models/product_model.dart';

abstract class AddProductToDBRepo {
  Future<void> addCategory(AddProductCategoryModel model);
  Future<void> addKind(AddProductKindModel model);
  Future<void> addProduct(AddProductProductModel model);
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
    model.kindId = FireBaseServices.generateID();
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
}

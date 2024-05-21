import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/add_product/data/models/category_model.dart';
import 'package:e_commerce/features/add_product/data/models/kind_model.dart';
import 'package:e_commerce/features/add_product/data/models/product_model.dart';

abstract class AddProductRepo {
  Future<Either<FailuerClass, bool>> addCategory(AddProductCategoryModel model);
  Future<Either<FailuerClass, bool>> addKind(AddProductKindModel model);
  Future<Either<FailuerClass, bool>> addProduct(AddProductProductModel model);
  Future<Either<FailuerClass, bool>> cheekNameInCategory(
      AddProductCategoryModel model);
  Future<Either<FailuerClass, bool>> cheekNameInKind(AddProductKindModel model);
  Future<Either<FailuerClass, bool>> cheekNameInProduct(
      AddProductProductModel model);
  Future<Either<FailuerClass, String>> addImage(File imageFile);
}

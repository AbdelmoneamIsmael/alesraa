import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/helper/ui_helper.dart';
import 'package:e_commerce/features/add_product/data/datasources/remote_data_source.dart';
import 'package:e_commerce/features/add_product/data/models/category_model.dart';
import 'package:e_commerce/features/add_product/data/models/kind_model.dart';
import 'package:e_commerce/features/add_product/data/models/product_model.dart';
import 'package:e_commerce/features/add_product/domain/repositories/add_product_repo.dart';

class AddProductRepoImpl implements AddProductRepo {
  final UploadeProduct uploadeProduct;
  AddProductRepoImpl({required this.uploadeProduct});
  @override
  Future<Either<FailuerClass, bool>> addCategory(
      AddProductCategoryModel model) async {
    try {
      await uploadeProduct.addCategory(model);
      return const Right(true);
    } catch (e) {
      PrinterHelper(e.toString());
      if (e is FirebaseException) {
        return Left(ServerFailuer.fromFireBase(e));
      } else {
        return Left(ServerFailuer(e.toString()));
      }
    }
  }

  @override
  Future<Either<FailuerClass, bool>> addKind(AddProductKindModel model) async {
    try {
      await uploadeProduct.addKind(model);
      return const Right(true);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(ServerFailuer.fromFireBase(e));
      } else {
        return Left(ServerFailuer(e.toString()));
      }
    }
  }

  @override
  Future<Either<FailuerClass, bool>> addProduct(
      AddProductProductModel model) async {
    try {
      await uploadeProduct.addProduct(model);
      return const Right(true);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(ServerFailuer.fromFireBase(e));
      } else {
        return Left(ServerFailuer(e.toString()));
      }
    }
  }

  @override
  Future<Either<FailuerClass, String>> addImage(File imageFile) async {
    try {
      final imageUrl = await uploadeProduct.uploadImage(imageFile);
      return Right(imageUrl);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(ServerFailuer.fromFireBase(e));
      } else {
        return Left(ServerFailuer(e.toString()));
      }
    }
  }

  @override
  Future<Either<FailuerClass, bool>> cheekNameInCategory(
      AddProductCategoryModel model) async {
    try {
      var result =
          await uploadeProduct.cheekTheNameExesistInCategory(model.name!);
      return Right(result);
    } on Exception catch (e) {
      if (e is FirebaseException) {
        return Left(ServerFailuer.fromFireBase(e));
      } else {
        return Left(ServerFailuer(e.toString()));
      }
    }
  }

  @override
  Future<Either<FailuerClass, bool>> cheekNameInKind(
      AddProductKindModel model) {
    // TODO: implement cheekNameInKind
    throw UnimplementedError();
  }

  @override
  Future<Either<FailuerClass, bool>> cheekNameInProduct(
      AddProductProductModel model) {
    // TODO: implement cheekNameInProduct
    throw UnimplementedError();
  }
}

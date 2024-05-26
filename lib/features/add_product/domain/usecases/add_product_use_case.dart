import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/helper/ui_helper.dart';
import 'package:e_commerce/core/helper/use_case_parmter.dart';
import 'package:e_commerce/features/add_product/data/models/product_model.dart';
import 'package:e_commerce/features/add_product/domain/repositories/add_product_repo.dart';

class UploadeProductUseCase extends UseCase<bool, AddProductModel, File> {
  AddProductRepo addProductRepo;

  UploadeProductUseCase({required this.addProductRepo});

  @override
  Future<Either<FailuerClass, bool>> call(AddProductModel params,
      [File? params2]) async {
    try {
      var result = await addProductRepo.cheekNameInProduct(params);
      return result.fold((l) {
        PrinterHelper("failer to exute methode");
        return Left(l);
      }, (r) async {
        if (r) {
          PrinterHelper("it is there");
          //if true then there is name and i cant upload with same name
          return const Right(false);
        } else {
          // no same name there so i can uploade
          PrinterHelper("it  not there uploade please");
          var resultUploadImage = await addProductRepo.addImage(params2!);
          return resultUploadImage.fold((l) {
            return Left(l);
          }, (r) {
            params.image = r;
            return addProductRepo.addProduct(params);
          });
        }
      });
    } on Exception catch (e) {
      if (e is FirebaseException) {
        return Left(ServerFailuer.fromFireBase(e));
      } else {
        return Left(ServerFailuer(e.toString()));
      }
    }
  }
}

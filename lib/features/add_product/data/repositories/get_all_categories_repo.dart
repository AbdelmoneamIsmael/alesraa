import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/add_product/data/datasources/remote/get_all_categories.dart';
import 'package:e_commerce/features/add_product/data/models/category_model.dart';
import 'package:e_commerce/features/add_product/domain/repositories/get_all_category_repo.dart';
import 'package:firebase_storage/firebase_storage.dart';

class GetAllCategoriesRepo extends GetAllCategoryDomainRepo {
  final GetAllCategoryDataRepoImpl dataRepoImpl;

  GetAllCategoriesRepo({required this.dataRepoImpl});

  @override
  Future<Either<FailuerClass, List<AddProductCategoryModel>>>
      getAllCategory() async {
    try {
      var result = await dataRepoImpl.getAllCategory();
      return Right(result);
    } catch (e) {
      if (e is FirebaseException) {
        return Left(ServerFailuer.fromFireBase(e));
      } else {
        return Left(ServerFailuer(e.toString()));
      }
    }
  }
}

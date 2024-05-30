import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/models/kind_model.dart';
import 'package:e_commerce/features/product_listing/data/datasources/get_related_datasource.dart';
import 'package:e_commerce/features/product_listing/domain/repositories/get_related_product_repo.dart';

class GetRelatedProductRepoImpl implements GetRelatedProductRepo {
  final GetRelatedDatasource getRelatedDatasource;

  GetRelatedProductRepoImpl({required this.getRelatedDatasource});
  @override
  Future<Either<FailuerClass, Stream<QuerySnapshot<Map<String, dynamic>>>>>
      getRelatedProduct({required KindModel kindModel}) async {
    try {
      var result =
          await getRelatedDatasource.getRelatedProduct(kindModel: kindModel);
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

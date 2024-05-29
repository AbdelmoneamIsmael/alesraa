import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/products_related_to_category/data/datasources/get_kinds_remote.dart';
import 'package:e_commerce/features/products_related_to_category/domain/repositories/get_kind_repo.dart';

class GetKindsDataRepo extends GetKindRepo {
  final GetKindsRemote getKindsRemote;

  GetKindsDataRepo({required this.getKindsRemote});
  @override
  Future<Either<FailuerClass, Stream<QuerySnapshot<Map<String, dynamic>>>>>
      getKinds(String categoryId) async {
    try {
      var result = await getKindsRemote.getKinds(categoryId);
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';

abstract class GetKindRepo {
  Future<Either<FailuerClass, Stream<QuerySnapshot<Map<String, dynamic>>>>>
      getKinds(String categoryId);
}

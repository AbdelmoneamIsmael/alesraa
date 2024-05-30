import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/models/kind_model.dart';

abstract class GetRelatedProductRepo {
  Future<Either<FailuerClass, Stream<QuerySnapshot<Map<String, dynamic>>>>>
      getRelatedProduct({required KindModel kindModel});
}

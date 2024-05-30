import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/firebase_services/firebase_services.dart';
import 'package:e_commerce/core/models/kind_model.dart';

abstract class GetRelatedDatasource {
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getRelatedProduct(
      {required KindModel kindModel});
}

class GetRelatedDatasourceImpl implements GetRelatedDatasource {
  @override
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getRelatedProduct(
      {required KindModel kindModel}) async {
    return FireBaseServices.productsCall
        .where("kind_referance", isEqualTo: kindModel.kindReferance)
        .orderBy(
          "name",
        )
        .snapshots();
  }
}

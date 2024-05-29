import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/firebase_services/firebase_services.dart';

abstract class GetCategoriesRemoteRepo {
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getAllCategories();
}

class GetCategoriesRemoteRepoImpl extends GetCategoriesRemoteRepo {
  @override
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getAllCategories() async {
    return FireBaseServices.categoryCall.snapshots();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/firebase_services/firebase_services.dart';

abstract class GetKindsRemote {
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getKinds(
      String categoryId);
}

class GetKindsRemoteImpl implements GetKindsRemote {
  @override
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> getKinds(
      String categoryId) async {
    return FireBaseServices.categoryCall
        .doc(categoryId)
        .collection("kinds")
        .snapshots();
  }
}

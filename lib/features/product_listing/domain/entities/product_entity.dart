import 'package:cloud_firestore/cloud_firestore.dart';

class ProductEntity {
  String pName;
  String pImage;
  num pPrice;
  String pDescribtion;
  String pId;
  DocumentReference<Map<String, dynamic>>? pReferance;

  ProductEntity({
    required this.pName,
    required this.pImage,
    required this.pReferance,
    required this.pPrice,
    required this.pDescribtion,
    required this.pId,
  });
}

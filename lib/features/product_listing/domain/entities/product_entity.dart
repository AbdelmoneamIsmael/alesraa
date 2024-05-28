import 'package:cloud_firestore/cloud_firestore.dart';

class ProductEntity {
  String pName;
  String pImage;
  num pPrice;
  String pCategory;
  String pKind;
  num pmainPrice;
  String pDescribtion;
  num pRating;
  num pAmount;
  String pId;
  DocumentReference<Map<String, dynamic>>? pReferance;

  ProductEntity({
    required this.pAmount,
    required this.pmainPrice,
    required this.pName,
    required this.pKind,
    required this.pCategory,
    required this.pRating,
    required this.pImage,
    required this.pReferance,
    required this.pPrice,
    required this.pDescribtion,
    required this.pId,
  });
}

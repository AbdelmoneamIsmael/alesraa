import 'package:cloud_firestore/cloud_firestore.dart';

class HomeProductEntity {
  String productName;
  String productImage;
  num productPrice;
  String productDescribtion;
  String id;
  DocumentReference<Map<String, dynamic>>? documentReference;

  HomeProductEntity({
    required this.productName,
    required this.productImage,
    required this.documentReference,
    required this.productPrice,
    required this.productDescribtion,
    required this.id,
  });
}

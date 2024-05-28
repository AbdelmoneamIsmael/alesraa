import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/product_listing/domain/entities/product_entity.dart';

class HomeProductEntity extends ProductEntity {
  String productName;

  String productImage;

  num productPrice;

  String productDescribtion;

  String id;

  DocumentReference<Map<String, dynamic>>? productReferance;

  HomeProductEntity({
    required this.productName,
    required this.productImage,
    required this.productReferance,
    required this.productPrice,
    required this.productDescribtion,
    required this.id,
  }) : super(
            pName: productName,
            pImage: productImage,
            pReferance: productReferance,
            pPrice: productPrice,
            pDescribtion: productDescribtion,
            pId: id);
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/product_listing/domain/entities/product_entity.dart';

class HomeProductEntity extends ProductEntity {
  String productName;

  String productImage;

  num productPrice;
  num productRating;
  num productMainPrice;
  num productAmount;

  String productDescribtion;
  String productKind;
  String productCategory;

  String id;

  DocumentReference<Map<String, dynamic>>? productReferance;

  HomeProductEntity({
    required this.productAmount,
    required this.productName,
    required this.productImage,
    required this.productReferance,
    required this.productPrice,
    required this.productDescribtion,
    required this.productKind,
    required this.productCategory,
    required this.productRating,
    required this.productMainPrice,
    required this.id,
  }) : super(
            pAmount: productAmount,
            pCategory: productCategory,
            pRating: productRating,
            pKind: productKind,
            pmainPrice: productMainPrice,
            pName: productName,
            pImage: productImage,
            pReferance: productReferance,
            pPrice: productPrice,
            pDescribtion: productDescribtion,
            pId: id);
}

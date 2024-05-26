import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/firebase_services/firebase_services.dart';

class ProductModel {
  ProductModel({
    required this.updatedAt,
    required this.createdAt,
    required this.productId,
    required this.kindReferance,
    required this.categoryReferance,
    required this.name,
    required this.code,
    required this.details,
    required this.amount,
    required this.kindName,
    required this.categoryName,
    required this.favourit,
    required this.mainPrice,
    required this.sellPeice,
    required this.raiting,
    required this.image,
    required this.productReferance,
  });

  String? productId;
  DocumentReference<Map<String, dynamic>>? kindReferance;
  DocumentReference<Map<String, dynamic>>? categoryReferance;
  String? name;
  String? code;
  String? details;
  num? amount;
  String? kindName;
  String? categoryName;
  bool? favourit;
  num? mainPrice;
  num? sellPeice;
  num? raiting;
  String? image;
  DocumentReference<Map<String, dynamic>>? productReferance;
  Timestamp createdAt;
  Timestamp updatedAt;

  ProductModel copyWith({
    String? productId,
    DocumentReference<Map<String, dynamic>>? kindReferance,
    DocumentReference<Map<String, dynamic>>? categoryReferance,
    String? name,
    String? code,
    String? details,
    num? amount,
    String? kindName,
    String? categoryName,
    bool? favourit,
    num? mainPrice,
    num? sellPeice,
    num? raiting,
    String? image,
    DocumentReference<Map<String, dynamic>>? productReferance,
    Timestamp? createdAt,
    Timestamp? updatedAt,
  }) {
    return ProductModel(
      productId: productId ?? this.productId,
      kindReferance: kindReferance ?? this.kindReferance,
      categoryReferance: categoryReferance ?? this.categoryReferance,
      name: name ?? this.name,
      code: code ?? this.code,
      details: details ?? this.details,
      amount: amount ?? this.amount,
      kindName: kindName ?? this.kindName,
      categoryName: categoryName ?? this.categoryName,
      favourit: favourit ?? this.favourit,
      mainPrice: mainPrice ?? this.mainPrice,
      sellPeice: sellPeice ?? this.sellPeice,
      raiting: raiting ?? this.raiting,
      image: image ?? this.image,
      productReferance: productReferance ?? this.productReferance,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: updatedAt ?? this.createdAt,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
      productId: json["Product_id"],
      kindReferance: json["kind_referance"],
      categoryReferance: json["category_referance"],
      name: json["name"],
      code: json["code"],
      details: json["details"],
      amount: json["amount"],
      kindName: json["kind_name"],
      categoryName: json["category_name"],
      favourit: json["favourit"],
      mainPrice: json["main_price"],
      sellPeice: json["sell_peice"],
      raiting: json["raiting"],
      image: json["image"],
      productReferance: json["product_referance"],
    );
  }
  factory ProductModel.empty() {
    return ProductModel(
      updatedAt: Timestamp.now(),
      createdAt: Timestamp.now(),
      productId: FireBaseServices.generateID(),
      kindReferance: null,
      categoryReferance: null,
      name: "",
      code: "",
      details: "",
      amount: 0,
      kindName: "",
      categoryName: "",
      favourit: false,
      mainPrice: 0,
      sellPeice: 0,
      raiting: 0,
      image: "",
      productReferance: null,
    );
  }

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "Product_id": productId,
        "kind_referance": kindReferance,
        "category_referance": categoryReferance,
        "name": name,
        "code": code,
        "details": details,
        "amount": amount,
        "kind_name": kindName,
        "category_name": categoryName,
        "favourit": favourit,
        "main_price": mainPrice,
        "sell_peice": sellPeice,
        "raiting": raiting,
        "image": image,
        "product_referance": productReferance,
      };

  @override
  String toString() {
    return "$productId, $kindReferance, $categoryReferance, $name, $code, $details, $amount, $kindName, $categoryName, $favourit, $mainPrice, $sellPeice, $raiting, $image, $productReferance, ";
  }
}

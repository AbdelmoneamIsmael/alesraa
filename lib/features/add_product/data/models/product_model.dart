import 'package:cloud_firestore/cloud_firestore.dart';

class AddProductProductModel {
  AddProductProductModel({
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

  AddProductProductModel copyWith({
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
  }) {
    return AddProductProductModel(
      productId: productId ?? this.productId,
      kindReferance: kindReferance ?? kindReferance,
      categoryReferance: categoryReferance ?? categoryReferance,
      name: name ?? name,
      code: code ?? code,
      details: details ?? details,
      amount: amount ?? amount,
      kindName: kindName ?? kindName,
      categoryName: categoryName ?? categoryName,
      favourit: favourit ?? favourit,
      mainPrice: mainPrice ?? mainPrice,
      sellPeice: sellPeice ?? sellPeice,
      raiting: raiting ?? raiting,
      image: image ?? image,
      productReferance: productReferance ?? productReferance,
    );
  }

  factory AddProductProductModel.fromJson(Map<String, dynamic> json) {
    return AddProductProductModel(
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

  Map<String, dynamic> toJson() => {
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

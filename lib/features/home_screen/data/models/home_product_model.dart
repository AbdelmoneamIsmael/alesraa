import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/firebase_services/firebase_services.dart';
import 'package:e_commerce/features/home_screen/domain/entities/product_entity.dart';

class HomeProductModel extends HomeProductEntity {
  HomeProductModel({
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
    required this.referance,
  }) : super(
            productName: name!,
            productImage: image!,
            productReferance: referance,
            productPrice: sellPeice!,
            productDescribtion: details!,
            id: productId!);

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

  DocumentReference<Map<String, dynamic>>? referance;
  Timestamp createdAt;
  Timestamp updatedAt;

  HomeProductModel copyWith({
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
    return HomeProductModel(
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
      referance: productReferance ?? this.productReferance,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: updatedAt ?? this.createdAt,
    );
  }

  factory HomeProductModel.fromJson(Map<String, dynamic> json) {
    return HomeProductModel(
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
      referance: json["product_referance"],
    );
  }
  factory HomeProductModel.empty() {
    return HomeProductModel(
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
      referance: null,
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
        "product_referance": referance,
      };

  @override
  String toString() {
    return "$productId, $kindReferance, $categoryReferance, $name, $code, $details, $amount, $kindName, $categoryName, $favourit, $mainPrice, $sellPeice, $raiting, $image, $referance, ";
  }
}

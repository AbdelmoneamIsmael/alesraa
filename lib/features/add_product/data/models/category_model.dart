import 'package:cloud_firestore/cloud_firestore.dart';

class AddProductCategoryModel {
  AddProductCategoryModel({
    required this.categoryId,
    required this.categoryReferance,
    required this.image,
    required this.name,
  });

  String? categoryId;
  DocumentReference<Map<String, dynamic>>? categoryReferance;
  String? image;
  String? name;

  AddProductCategoryModel copyWith({
    String? categoryId,
    DocumentReference<Map<String, dynamic>>? categoryReferance,
    String? image,
    String? name,
  }) {
    return AddProductCategoryModel(
      categoryId: categoryId ?? this.categoryId,
      categoryReferance: categoryReferance ?? categoryReferance,
      image: image ?? image,
      name: name ?? name,
    );
  }

  factory AddProductCategoryModel.fromJson(Map<String, dynamic> json) {
    return AddProductCategoryModel(
      categoryId: json["category_id"],
      categoryReferance: json["category_referance"],
      image: json["image"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_referance": categoryReferance,
        "image": image,
        "name": name,
      };

  @override
  String toString() {
    return "$categoryId, $categoryReferance, $image, $name, ";
  }
}

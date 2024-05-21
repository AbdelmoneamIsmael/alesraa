import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  CategoryModel({
    required this.categoryId,
    required this.categoryReferance,
    required this.image,
    required this.name,
  });

  String? categoryId;
  DocumentReference<Map<String, dynamic>>? categoryReferance;
  String? image;
  String? name;

  CategoryModel copyWith({
    String? categoryId,
    DocumentReference<Map<String, dynamic>>? categoryReferance,
    String? image,
    String? name,
  }) {
    return CategoryModel(
      categoryId: categoryId ?? this.categoryId,
      categoryReferance: categoryReferance ?? categoryReferance,
      image: image ?? image,
      name: name ?? name,
    );
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
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

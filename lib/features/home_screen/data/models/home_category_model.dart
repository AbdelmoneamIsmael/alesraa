import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/home_screen/domain/entities/category_entity.dart';

class HomeCategoryModel extends HomeCategoryEntity {
  HomeCategoryModel({
    required this.categoryId,
    required this.categoryReferance,
    required this.image,
    required this.name,
  }) : super(
          categoryName: name!,
          categoryImage: image!,
          id: categoryId!,
          documentReference: categoryReferance,
        );

  String? categoryId;

  DocumentReference<Map<String, dynamic>>? categoryReferance;
  String? image;
  String? name;

  HomeCategoryModel copyWith({
    String? categoryId,
    DocumentReference<Map<String, dynamic>>? categoryReferance,
    String? image,
    String? name,
  }) {
    return HomeCategoryModel(
      categoryId: categoryId ?? this.categoryId,
      categoryReferance: categoryReferance ?? categoryReferance,
      image: image ?? image,
      name: name ?? name,
    );
  }

  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) {
    return HomeCategoryModel(
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

import 'package:cloud_firestore/cloud_firestore.dart';

class AddProductKindModel {
  AddProductKindModel({
    required this.kindId,
    required this.kindReferance,
    required this.categoryReferance,
    required this.image,
    required this.name,
  });

  String? kindId;
  DocumentReference<Map<String, dynamic>>? kindReferance;
  DocumentReference<Map<String, dynamic>>? categoryReferance;
  String? image;
  String? name;

  AddProductKindModel copyWith({
    String? kindId,
    DocumentReference<Map<String, dynamic>>? kindReferance,
    DocumentReference<Map<String, dynamic>>? categoryReferance,
    String? image,
    String? name,
  }) {
    return AddProductKindModel(
      kindId: kindId ?? this.kindId,
      kindReferance: kindReferance ?? this.kindReferance,
      categoryReferance: categoryReferance ?? categoryReferance,
      image: image ?? image,
      name: name ?? name,
    );
  }

  factory AddProductKindModel.fromJson(Map<String, dynamic> json) {
    return AddProductKindModel(
      kindId: json["kind_id"],
      kindReferance: json["kind_referance"],
      categoryReferance: json["category_referance"],
      image: json["image"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "kind_id": kindId,
        "kind_referance": kindReferance,
        "category_referance": categoryReferance,
        "image": image,
        "name": name,
      };

  @override
  String toString() {
    return "$kindId, $kindReferance, $categoryReferance, $image, $name, ";
  }
}

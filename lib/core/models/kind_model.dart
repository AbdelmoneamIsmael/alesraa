import 'package:cloud_firestore/cloud_firestore.dart';

class KindModel {
  KindModel({
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

  KindModel copyWith({
    String? kindId,
    DocumentReference<Map<String, dynamic>>? kindReferance,
    DocumentReference<Map<String, dynamic>>? categoryReferance,
    String? image,
    String? name,
  }) {
    return KindModel(
      kindId: kindId ?? this.kindId,
      kindReferance: kindReferance ?? kindReferance,
      categoryReferance: categoryReferance ?? categoryReferance,
      image: image ?? image,
      name: name ?? name,
    );
  }

  factory KindModel.fromJson(Map<String, dynamic> json) {
    return KindModel(
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

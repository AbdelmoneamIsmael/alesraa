import 'package:cloud_firestore/cloud_firestore.dart';

class HomeCategoryEntity {
  String categoryName;
  String categoryImage;
  String id;
  DocumentReference<Map<String, dynamic>>? documentReference;

  HomeCategoryEntity({
    required this.categoryName,
    required this.categoryImage,
    required this.id,
    required this.documentReference,
  });
}

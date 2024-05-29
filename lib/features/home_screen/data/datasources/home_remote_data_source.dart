import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/firebase_services/firebase_services.dart';
import 'package:e_commerce/features/home_screen/data/models/home_category_model.dart';
import 'package:e_commerce/features/home_screen/domain/entities/category_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<HomeCategoryEntity>> fetchCategories();
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> fetchProducts();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<List<HomeCategoryEntity>> fetchCategories() async {
    var result = await FireBaseServices.categoryCall.limit(5).get();
    List<HomeCategoryEntity> categoryList = [];
    for (var element in result.docs) {
      categoryList.add(HomeCategoryModel.fromJson(element.data()));
    }
    return categoryList;
  }

  @override
  Future<Stream<QuerySnapshot<Map<String, dynamic>>>> fetchProducts() async {
    var result = FireBaseServices.productsCall
        .orderBy("createdAt", descending: true)
        .limit(4)
        .snapshots();

    return result;
  }
}

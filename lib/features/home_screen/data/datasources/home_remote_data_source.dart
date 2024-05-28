import 'package:e_commerce/core/firebase_services/firebase_services.dart';
import 'package:e_commerce/features/home_screen/data/models/home_category_model.dart';
import 'package:e_commerce/features/home_screen/data/models/home_product_model.dart';
import 'package:e_commerce/features/home_screen/domain/entities/category_entity.dart';
import 'package:e_commerce/features/home_screen/domain/entities/product_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<HomeCategoryEntity>> fetchCategories();
  Future<List<HomeProductEntity>> fetchProducts();
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
  Future<List<HomeProductEntity>> fetchProducts() async {
    var result = await FireBaseServices.productsCall
        .orderBy("createdAt", descending: true)
        .limit(4)
        .get();
    List<HomeProductEntity> latestList = [];
    for (var element in result.docs) {
      latestList.add(HomeProductModel.fromJson(element.data()));
    }
    return latestList;
  }
}

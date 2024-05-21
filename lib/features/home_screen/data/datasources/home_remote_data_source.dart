import 'package:e_commerce/features/home_screen/domain/entities/category_entity.dart';
import 'package:e_commerce/features/home_screen/domain/entities/product_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<HomeCategoryEntity>> fetchCategories();
  Future<List<HomeProductEntity>> fetchProducts();
}

// class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
//   @override
//   Future<List<HomeCategoryEntity>> fetchCategories() {}

//   @override
//   Future<List<HomeProductEntity>> fetchProducts() {}
// }

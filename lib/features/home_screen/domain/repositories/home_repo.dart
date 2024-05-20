import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/home_screen/domain/entities/category_entity.dart';
import 'package:e_commerce/features/home_screen/domain/entities/product_entity.dart';

abstract class HomeRepo {
  Future<Either<FailuerClass, List<CategoryEntity>>> fetchCategories();
  Future<Either<FailuerClass, List<ProductEntity>>> fetchProducts();
}

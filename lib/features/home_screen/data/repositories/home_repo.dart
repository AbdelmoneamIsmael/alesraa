import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/home_screen/data/datasources/home_remote_data_source.dart';
import 'package:e_commerce/features/home_screen/domain/entities/category_entity.dart';
import 'package:e_commerce/features/home_screen/domain/entities/product_entity.dart';
import 'package:e_commerce/features/home_screen/domain/repositories/home_repo.dart';

class HomeRepoDataImple extends HomeRepoDomain {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoDataImple({required this.homeRemoteDataSource});
  @override
  Future<Either<FailuerClass, List<HomeCategoryEntity>>>
      fetchCategories() async {
    try {
      var result = await homeRemoteDataSource.fetchCategories();
      return Right(result);
    } catch (e) {
      return Left(ServerFailuer(e.toString()));
    }
  }

  @override
  Future<Either<FailuerClass, List<HomeProductEntity>>> fetchProducts() async {
    try {
      var result = await homeRemoteDataSource.fetchProducts();
      return Right(result);
    } catch (e) {
      return Left(ServerFailuer(e.toString()));
    }
  }
}

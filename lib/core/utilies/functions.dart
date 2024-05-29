import 'package:e_commerce/features/add_product/data/datasources/remote/get_all_categories.dart';
import 'package:e_commerce/features/add_product/data/repositories/get_all_categories_repo.dart';
import 'package:e_commerce/features/category_screen/data/datasources/remote_data_source/get_categories.dart';
import 'package:e_commerce/features/category_screen/data/repositories/get_all_categories_data.dart';
import 'package:e_commerce/features/home_screen/data/datasources/home_remote_data_source.dart';
import 'package:e_commerce/features/home_screen/data/repositories/home_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void getAllocators() {
  getIt.registerSingleton<GetAllCategoriesRepo>(
    GetAllCategoriesRepo(
      dataRepoImpl: GetAllCategoryDataRepoImpl(),
    ),
  );
  getIt.registerSingleton<HomeRepoDataImple>(
    HomeRepoDataImple(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(),
    ),
  );

  getIt.registerSingleton<GetAllCategoriesData>(
    GetAllCategoriesData(
      getCategoriesRepo: GetCategoriesRemoteRepoImpl(),
    ),
  );
}

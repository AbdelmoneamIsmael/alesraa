import 'package:e_commerce/features/add_product/data/datasources/remote/get_all_categories.dart';
import 'package:e_commerce/features/add_product/data/repositories/get_all_categories_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void getAllCategoryAllocator() {
  getIt.registerSingleton<GetAllCategoriesRepo>(
    GetAllCategoriesRepo(
      dataRepoImpl: GetAllCategoryDataRepoImpl(),
    ),
  );
}

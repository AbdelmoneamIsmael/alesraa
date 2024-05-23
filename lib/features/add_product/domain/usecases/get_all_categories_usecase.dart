import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/helper/use_case_no_parameter.dart';
import 'package:e_commerce/features/add_product/data/models/category_model.dart';
import 'package:e_commerce/features/add_product/domain/repositories/get_all_category_repo.dart';

class GetAllCategoriesUseCase extends UseCase<List<AddProductCategoryModel>> {
  final GetAllCategoryDomainRepo getAllCategorydomainRepo;

  GetAllCategoriesUseCase({required this.getAllCategorydomainRepo});

  @override
  Future<Either<FailuerClass, List<AddProductCategoryModel>>> call() {
    return getAllCategorydomainRepo.getAllCategory();
  }
}

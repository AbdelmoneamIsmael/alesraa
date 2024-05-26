import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/helper/use_case_parmter.dart';
import 'package:e_commerce/features/add_product/data/models/kind_model.dart';
import 'package:e_commerce/features/add_product/domain/repositories/get_all_category_repo.dart';

class GetAllKindUseCase
    extends UseCase<List<AddProductKindModel>, String, NoParams> {
  final GetAllCategoryDomainRepo getAllCategorydomainRepo;

  GetAllKindUseCase({required this.getAllCategorydomainRepo});

  @override
  Future<Either<FailuerClass, List<AddProductKindModel>>> call(String params,
      [NoParams? params2]) {
    return getAllCategorydomainRepo.getAllKind(params);
  }
}

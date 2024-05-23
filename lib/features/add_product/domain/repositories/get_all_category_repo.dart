import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/add_product/data/models/category_model.dart';

abstract class GetAllCategoryDomainRepo {
  Future<Either<FailuerClass, List<AddProductCategoryModel>>> getAllCategory();
}

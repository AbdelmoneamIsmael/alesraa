import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/category_screen/data/datasources/remote_data_source/get_categories.dart';
import 'package:e_commerce/features/category_screen/domain/repositories/category_page_repo.dart';

class GetAllCategoriesData extends CategoryPageRepo {
  final GetCategoriesRemoteRepo getCategoriesRepo;

  GetAllCategoriesData({required this.getCategoriesRepo});

  @override
  Future<Either<FailuerClass, Stream<QuerySnapshot<Map<String, dynamic>>>>>
      getCategories() async {
    try {
      var data = await getCategoriesRepo.getAllCategories();
      return right(data);
    } catch (e) {
      return left(ServerFailuer(e.toString()));
    }
  }
}

import 'package:e_commerce/core/firebase_services/firebase_services.dart';
import 'package:e_commerce/features/add_product/data/models/category_model.dart';

abstract class GetAllCategoryRepoFromDB {
  Future<List<AddProductCategoryModel>> getAllCategory();
}

class GetAllCategoryDataRepoImpl implements GetAllCategoryRepoFromDB {
  @override
  Future<List<AddProductCategoryModel>> getAllCategory() async {
    List<AddProductCategoryModel> categoryList = [];
    var result = await FireBaseServices.categoryCall.get();
    for (var element in result.docs) {
      categoryList.add(AddProductCategoryModel.fromJson(element.data()));
    }
    return categoryList;
  }
}

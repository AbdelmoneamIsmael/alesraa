import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/add_product/data/models/category_model.dart';
import 'package:e_commerce/features/add_product/domain/usecases/get_all_categories_usecase.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/select_category_cubit/cubit/select_category_cubit_state.dart';

class GetAllCategoryCubit extends Cubit<SelectCategoryCubitState> {
  GetAllCategoryCubit({required this.getAllCategoryUseCase})
      : super(SelectCategoryCubitInitial());

  List<AddProductCategoryModel> allCategories = [];
  final GetAllCategoriesUseCase getAllCategoryUseCase;
  void getAllCategories() async {
    emit(GettingAllCategoies());
    var result = await getAllCategoryUseCase.call();
    result.fold((failuer) {
      emit(FailedToGetData(message: failuer.toString()));
    }, (r) {
      emit(SuccessToGetData(categories: r));
    });
  }
}

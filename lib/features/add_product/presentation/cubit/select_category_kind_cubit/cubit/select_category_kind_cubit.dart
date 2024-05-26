import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/add_product/data/models/kind_model.dart';
import 'package:e_commerce/features/add_product/domain/usecases/get_all_kinds_usecase.dart';

part 'select_category_kind_state.dart';

class SelectCategoryKindCubit extends Cubit<SelectCategoryKindState> {
  final GetAllKindUseCase getAllKindUseCase;
  final String categoryId;
  SelectCategoryKindCubit(
      {required this.getAllKindUseCase, required this.categoryId})
      : super(SelectCategoryKindInitial());

  void getAllKinds() async {
    emit(GettingAllCategoies());
    var result = await getAllKindUseCase.call(categoryId);
    result.fold((failuer) {
      emit(FailedToGetData(message: failuer.toString()));
    }, (r) {
      emit(SuccessToGetData(kinds: r));
    });
  }
}

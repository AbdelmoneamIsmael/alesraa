import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/models/kind_model.dart';
import 'package:e_commerce/features/products_related_to_category/domain/repositories/get_kind_repo.dart';

part 'products_related_to_category_state.dart';

class ProductsRelatedToCategoryCubit
    extends Cubit<ProductsRelatedToCategoryState> {
  ProductsRelatedToCategoryCubit({required this.repo, required this.categoryId})
      : super(ProductsRelatedToCategoryInitial());
  final GetKindRepo repo;
  final String categoryId;
  StreamSubscription? subscription;
  @override
  Future<void> close() {
    if (subscription != null) {
      subscription!.cancel();
    }
    return super.close();
  }

  Future<void> getAllRelatedKinds() async {
    emit(GettingKinds());

    var result = await repo.getKinds(categoryId);
    result.fold(
      (l) {
        emit(FailToGetKinds(message: l.message));
      },
      (r) {
        List<KindModel> kinds = [];
        subscription = r.listen((event) {
          kinds = [];
          for (final element in event.docs) {
            kinds.add(KindModel.fromJson(element.data()));
          }
          emit(SuccessToGetKinds(kindModel: kinds));
        });
      },
    );
  }
}

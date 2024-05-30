import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/models/kind_model.dart';
import 'package:e_commerce/features/home_screen/data/models/home_product_model.dart';
import 'package:e_commerce/features/product_listing/domain/entities/product_entity.dart';
import 'package:e_commerce/features/product_listing/domain/repositories/get_related_product_repo.dart';

part 'product_listing_state.dart';

class ProductListingCubit extends Cubit<ProductListingState> {
  ProductListingCubit({
    required this.kindModel,
    required this.getRelatedProductRepo,
  }) : super(ProductListingInitial());
  final KindModel kindModel;
  final GetRelatedProductRepo getRelatedProductRepo;
  StreamSubscription? getProductsSnapshot;
  @override
  Future<void> close() async {
    if (getProductsSnapshot != null) {
      getProductsSnapshot!.pause();
      getProductsSnapshot!.cancel();
    }
    super.close();
  }

  Future<void> getAllRelatedProducts() async {
    emit(LoadingRelatedProducts());
    var result =
        await getRelatedProductRepo.getRelatedProduct(kindModel: kindModel);
    result.fold(
      (l) => emit(FailureRelatedProducts()),
      (r) {
        getProductsSnapshot = r.listen((event) {
          emit(
            SuccessRelatedProducts(
              relatedProductsList: event.docs
                  .map((e) => HomeProductModel.fromJson(e.data()))
                  .toList(),
            ),
          );
        });
      },
    );
  }
}

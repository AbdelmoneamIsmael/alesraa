import 'package:bloc/bloc.dart';

part 'product_listing_state.dart';

class ProductListingCubit extends Cubit<ProductListingState> {
  ProductListingCubit() : super(ProductListingInitial());
}

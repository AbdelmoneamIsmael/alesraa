import 'package:bloc/bloc.dart';

part 'products_related_to_category_state.dart';

class ProductsRelatedToCategoryCubit
    extends Cubit<ProductsRelatedToCategoryState> {
  ProductsRelatedToCategoryCubit() : super(ProductsRelatedToCategoryInitial());
}

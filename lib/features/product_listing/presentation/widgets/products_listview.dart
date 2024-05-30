import 'package:e_commerce/core/widgets/product_card.dart';
import 'package:e_commerce/features/product_listing/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({
    super.key,
    required this.productsList,
  });
  final List<ProductEntity> productsList;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 160 / 270,
      ),
      itemBuilder: (context, index) => ProductCard(
        productEntity: productsList[index],
      ),
      itemCount: productsList.length,
    );
  }
}

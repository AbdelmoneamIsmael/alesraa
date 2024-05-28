import 'package:e_commerce/core/firebase_services/firebase_services.dart';
import 'package:e_commerce/core/widgets/product_card.dart';
import 'package:e_commerce/features/product_listing/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .724,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8),
      itemBuilder: (context, index) => ProductCard(
        productEntity: ProductEntity(
            pName: "productName",
            pImage: "",
            pReferance: FireBaseServices.productsCall.doc(),
            pPrice: 0,
            pDescribtion: "productDescribtion",
            pId: "id"),
      ),
      itemCount: 4,
    );
  }
}

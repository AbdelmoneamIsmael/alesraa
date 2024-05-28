import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/widgets/cashed_images.dart';
import 'package:e_commerce/features/product_listing/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: FittedBox(
              fit: BoxFit.cover,
              child: CashedImage(
                url: productEntity.pImage,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          productEntity.pName,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.medium,
          textAlign: TextAlign.left,
        ),
        Text(
          '${productEntity.pPrice} \$',
          style: AppTextStyle.medium.copyWith(color: AppColors.cyanColor),
          textAlign: TextAlign.center,
        ),
        Text(
          productEntity.pDescribtion,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.medium.copyWith(
            color: Colors.grey,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

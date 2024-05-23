import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/images.dart';
import 'package:e_commerce/core/const/strings.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 160 / 138,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(
                  image: AssetImage(AssetsImages.productsImages[index]),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: CircleAvatar(
                    foregroundColor: AppColors.primaryColor,
                    radius: 16,
                    backgroundColor: AppColors.blackColor,
                    child: Icon(
                      Icons.favorite_border,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            productsName[index],
            style: customMediumText(context),
            textAlign: TextAlign.center,
          ),
          Text(
            '99 \$',
            style: customMediumText(context),
            textAlign: TextAlign.center,
          ),
          Text(
            productsName[index],
            maxLines: 2,
            style: customMediumText(context).copyWith(
              color: Colors.grey,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

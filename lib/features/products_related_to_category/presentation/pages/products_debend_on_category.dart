import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/features/products_related_to_category/presentation/widgets/category_sub_kind_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategorySubKindScreen extends StatelessWidget {
  const CategorySubKindScreen({super.key, required this.categoryName});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomMainPageAppBar(
        appBarTitle: Text(
          categoryName,
          style: AppTextStyle.textMedium().copyWith(fontSize: 14),
        ),
        appBarLeadingWidget: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(IconAssets.arrowBackIcon),
        ),
      ),
      body: const SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Divider(
                height: 2,
                thickness: 2,
                color: AppColors.grey50,
              ),
            ),
            SubCategoryWidgetsList()
          ],
        ),
      ),
    );
  }

  Container _devider() {
    return Container(
      height: 2,
      color: AppColors.grey50,
    );
  }
}

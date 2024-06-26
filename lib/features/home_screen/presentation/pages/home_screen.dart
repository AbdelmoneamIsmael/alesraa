import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/utilies/responsive_healper.dart';
import 'package:e_commerce/core/widgets/app_scafold.dart';
import 'package:e_commerce/features/home_screen/presentation/widgets/category_view.dart';
import 'package:e_commerce/features/home_screen/presentation/widgets/home_app_bar.dart';
import 'package:e_commerce/features/home_screen/presentation/widgets/hot_offer.dart';
import 'package:e_commerce/features/home_screen/presentation/widgets/product_grid_view.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      appBar: HomeAppBar(
        context: context,
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Spaces.height16),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    const HotOfferPannel(),
                    categoryTitle(context, 'الانواع'),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: CategoryListView(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Spaces.height16),
                child: categoryTitle(context, 'احدث المنتجات'),
              ),
            ),
            const SliverGridView(),
          ],
        ),
      ),
    );
  }

  Widget categoryTitle(BuildContext context, String title) {
    return ListTile(
      dense: false,
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: AppTextStyle.headerInIntroBold25
            .copyWith(fontSize: 18.responsiveFontSize),
      ),
      trailing: Text(
        'عرض المزيد',
        style: AppTextStyle.regular14.copyWith(
            color: AppColors.cyanColor, fontSize: 12.responsiveFontSize),
      ),
    );
  }
}

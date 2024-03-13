import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:e_commerce/core/routes/routers.dart';
import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/features/product_listing/presentation/widgets/products_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ProductListingScreen extends StatefulWidget {
  const ProductListingScreen({super.key, required this.title});
  final String title;

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  late final Spaces screen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomMainPageAppBar(
        appBarTitle: Text(
          widget.title,
          style: AppTextStyle.textMedium().copyWith(fontSize: 14),
        ),
        appBarActions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(IconAssets.filterIcon),
          ),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(PageRoutes.searchScreen);
            },
            icon: SvgPicture.asset(IconAssets.searchIcon),
          ),
        ],
      ),
      body: const SafeArea(
        child: CustomScrollView(
          slivers: [ProductsListView()],
        ),
      ),
    );
  }
}

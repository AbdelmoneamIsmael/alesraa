import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:e_commerce/core/models/kind_model.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/utilies/responsive_healper.dart';
import 'package:e_commerce/core/widgets/app_scafold.dart';
import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/core/widgets/loading_widget.dart';
import 'package:e_commerce/core/widgets/small_no_data_widget.dart';
import 'package:e_commerce/features/product_listing/data/datasources/get_related_datasource.dart';
import 'package:e_commerce/features/product_listing/data/repositories/get_products.dart';
import 'package:e_commerce/features/product_listing/presentation/cubit/product_listing_cubit.dart';
import 'package:e_commerce/features/product_listing/presentation/widgets/products_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ProductListingScreen extends StatefulWidget {
  const ProductListingScreen({super.key, required this.kindModel});
  final KindModel kindModel;

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  late final Spaces screen;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductListingCubit(
        getRelatedProductRepo: GetRelatedProductRepoImpl(
          getRelatedDatasource: GetRelatedDatasourceImpl(),
        ),
        kindModel: widget.kindModel,
      )..getAllRelatedProducts(),
      child: ScreenWrapper(
        appBar: CustomMainPageAppBar(
          appBarTitle: Text(
            widget.kindModel.name!,
            style: AppTextStyle.medium14,
          ),
          appBarActions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(IconAssets.filterIcon),
            ),
            IconButton(
              onPressed: () {
                GoRouter.of(context).push(Routes.searchScreen);
              },
              icon: SvgPicture.asset(IconAssets.searchIcon),
            ),
          ],
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.responsiveWidth,
                ),
                sliver: BlocBuilder<ProductListingCubit, ProductListingState>(
                  builder: (context, state) {
                    return state is LoadingRelatedProducts
                        ? const SliverToBoxAdapter(
                            child: Center(child: LoadingWidget()),
                          )
                        : state is SuccessRelatedProducts
                            ? state.relatedProductsList.isEmpty
                                ? const SliverToBoxAdapter(
                                    child: Center(
                                      child: NoDataWidget(
                                        iconPath: IconAssets.productsSvg,
                                        title: "لا توجد منتجات في هذه الفئة",
                                        description:
                                            "من فضلك قم بادخال بعض المنتجات في هذة الفئة لعرضها",
                                        isIconColored: true,
                                      ),
                                    ),
                                  )
                                : ProductsListView(
                                    productsList: state.relatedProductsList,
                                  )
                            : SliverToBoxAdapter(
                                child: 1.verticalSpace,
                              );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:e_commerce/core/routes/routers.dart';
import 'package:e_commerce/core/utilies/functions.dart';
import 'package:e_commerce/core/utilies/responsive_healper.dart';
import 'package:e_commerce/core/widgets/loading_widget.dart';
import 'package:e_commerce/core/widgets/product_card.dart';
import 'package:e_commerce/core/widgets/small_no_data_widget.dart';
import 'package:e_commerce/features/home_screen/data/repositories/home_repo.dart';
import 'package:e_commerce/features/home_screen/presentation/cubit/get_productes/getlatestproduct_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SliverGridView extends StatelessWidget {
  const SliverGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetlatestproductCubit(
        context: context,
        homeRepoDomain: getIt.get<HomeRepoDataImple>(),
      )..getLatestProducts(),
      child: BlocBuilder<GetlatestproductCubit, GetlatestproductState>(
        builder: (context, state) {
          return state is LoadingGettingProducts
              ? const SliverToBoxAdapter(
                  child: Center(
                    child: LoadingWidget(),
                  ),
                )
              : state is SuccessGettingProducts
                  ? state.products.isEmpty
                      ? const SliverToBoxAdapter(
                          child: NoDataWidget(
                              iconPath: IconAssets.productsSvg,
                              title: "انت لم تضف اي منتح حتي الان",
                              description: "قم باضافة بعض المنتجات الخاصة بك",
                              color: Colors.white),
                        )
                      : SliverPadding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.responsiveWidth),
                          sliver: SliverGrid(
                            delegate: SliverChildBuilderDelegate(
                              childCount: state.products.length,
                              (context, index) => CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  GoRouter.of(context)
                                      .push(PageRoutes.productDetatils);
                                },
                                child: ProductCard(
                                  productEntity: state.products[index],
                                ),
                              ),
                            ),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 160 / 270,
                            ),
                          ),
                        )
                  : SliverToBoxAdapter(
                      child: 1.verticalSpace,
                    );
        },
      ),
    );
  }
}

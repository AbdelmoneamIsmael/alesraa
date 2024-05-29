import 'package:e_commerce/core/const/strings.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/utilies/responsive_healper.dart';
import 'package:e_commerce/core/widgets/cashed_images.dart';
import 'package:e_commerce/core/widgets/category_item.dart';
import 'package:e_commerce/core/widgets/small_no_data_widget.dart';
import 'package:e_commerce/features/products_related_to_category/presentation/cubit/products_related_to_category_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SubCategoryWidgetsList extends StatelessWidget {
  const SubCategoryWidgetsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsRelatedToCategoryCubit,
        ProductsRelatedToCategoryState>(
      builder: (context, state) {
        return state is SuccessToGetKinds
            ? state.kindModel.isNotEmpty
                ? SliverGrid.builder(
                    itemCount: state.kindModel.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.6,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemBuilder: (context, index) => CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        GoRouter.of(context).push(
                          Routes.productListing,
                          extra: state.kindModel[index],
                        );
                      },
                      child: CategoryWidget(
                        childImage:
                            CashedImage(url: state.kindModel[index].image!),
                        text: state.kindModel[index].name!,
                      ),
                    ),
                  )
                : const SliverToBoxAdapter(
                    child: NoDataWidget(
                        iconPath: IconAssets.categoriesSvg,
                        title: "لا يوجد اي فئة من هذا النوع ",
                        description:
                            "لا يوجد اي فئة من هذا النوع قم باضافة بعض الفئات لاظهارها",
                        color: Colors.white),
                  )
            : SliverToBoxAdapter(child: 1.verticalSpace);
      },
    );
  }
}

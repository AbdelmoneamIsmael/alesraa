import 'package:e_commerce/core/icons_assets/icon_assets.dart';

import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/utilies/responsive_healper.dart';
import 'package:e_commerce/core/widgets/cashed_images.dart';
import 'package:e_commerce/core/widgets/category_item.dart';
import 'package:e_commerce/core/widgets/small_no_data_widget.dart';
import 'package:e_commerce/features/category_screen/presentation/cubit/category_screen_cubit.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryScreenCubit, CategoryScreenState>(
      builder: (context, state) {
        return state is SuccessGetCategory
            ? state.categoriesModel.isEmpty
                ? const SliverToBoxAdapter(
                    child: NoDataWidget(
                      iconPath: IconAssets.categoriesSvg,
                      title: "لا يوجد انواع حتي الان",
                      description:
                          "لا يوجد انواع حتي الان قم باضافة بعض الانواع لاظهارها",
                    ),
                  )
                : SliverGrid.builder(
                    itemCount: state.categoriesModel.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 160 / 100,
                    ),
                    itemBuilder: (context, index) => CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        GoRouter.of(context).push(
                            Routes.productsDebendOnCategory,
                            extra: state.categoriesModel[index]);
                      },
                      child: CategoryWidget(
                        childImage: CashedImage(
                          url: state.categoriesModel[index].image!,
                        ),
                        text: state.categoriesModel[index].name!,
                      ),
                    ),
                  )
            : SliverToBoxAdapter(
                child: 1.verticalSpace,
              );
      },
    );
  }
}

import 'package:e_commerce/core/const/strings.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:e_commerce/core/routes/routes.dart';
import 'package:e_commerce/core/utilies/functions.dart';
import 'package:e_commerce/core/widgets/cashed_images.dart';
import 'package:e_commerce/core/widgets/category_item.dart';
import 'package:e_commerce/core/widgets/loading_widget.dart';
import 'package:e_commerce/core/widgets/small_no_data_widget.dart';
import 'package:e_commerce/features/home_screen/data/repositories/home_repo.dart';
import 'package:e_commerce/features/home_screen/presentation/cubit/get_category/get_categories_cubit.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCategoriesCubit(
          context: context, homeRepoDomain: getIt.get<HomeRepoDataImple>())
        ..getCategories(),
      child: BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
        builder: (context, state) {
          return state is LoadingGettingCategories
              ? const Center(
                  child: LoadingWidget(),
                )
              : state is SuccessGettingCategories
                  ? state.categories.isEmpty
                      ? const NoDataWidget(
                          iconPath: IconAssets.categoriesSvg,
                          title: "انت لم تضف اي نوع حتي الان",
                          description: "قم باضافة بعض الانواع الخاصة بك",
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            height: 120,
                            child: Row(
                              children: List.generate(
                                state.categories.length,
                                (index) => AspectRatio(
                                  aspectRatio: 76 / 60,
                                  child: CupertinoButton(
                                    padding: EdgeInsets.zero,
                                    minSize: 0,
                                    onPressed: () => GoRouter.of(context).push(
                                        Routes.productsDebendOnCategory,
                                        extra: markLabels[index]),
                                    child: CategoryWidget(
                                      childImage: CashedImage(
                                          url: state
                                              .categories[index].categoryImage),
                                      text:
                                          state.categories[index].categoryName,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                  : const SizedBox();
        },
      ),
    );
  }
}

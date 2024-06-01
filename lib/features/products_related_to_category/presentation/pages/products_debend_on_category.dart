import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:e_commerce/core/widgets/app_scafold.dart';
import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/core/widgets/loading_widget.dart';
import 'package:e_commerce/features/products_related_to_category/data/datasources/get_kinds_remote.dart';
import 'package:e_commerce/features/products_related_to_category/data/repositories/get_kinds_data_repo.dart';
import 'package:e_commerce/features/products_related_to_category/presentation/cubit/products_related_to_category_cubit.dart';
import 'package:e_commerce/features/products_related_to_category/presentation/widgets/category_sub_kind_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CategorySubKindScreen extends StatelessWidget {
  const CategorySubKindScreen({
    super.key,
    required this.categoryId,
    required this.name,
  });
  final String categoryId, name;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsRelatedToCategoryCubit(
        categoryId: categoryId,
        repo: GetKindsDataRepo(
          getKindsRemote: GetKindsRemoteImpl(),
        ),
      )..getAllRelatedKinds(),
      child: BlocBuilder<ProductsRelatedToCategoryCubit,
          ProductsRelatedToCategoryState>(
        builder: (context, state) {
          return ScreenWrapper(
            appBar: CustomMainPageAppBar(
              appBarTitle: Text(
                name,
                style: AppTextStyle.medium14,
              ),
              appBarLeadingWidget: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(IconAssets.arrowBackIcon),
              ),
            ),
            body: SafeArea(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  const SliverToBoxAdapter(
                    child: Divider(
                      height: 2,
                      thickness: 2,
                      color: AppColors.grey50,
                    ),
                  ),
                  state is GettingKinds
                      ? const SliverToBoxAdapter(
                          child: Center(
                            child: LoadingWidget(),
                          ),
                        )
                      : const SubCategoryWidgetsList()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

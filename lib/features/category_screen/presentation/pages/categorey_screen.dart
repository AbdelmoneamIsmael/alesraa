import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/utilies/functions.dart';
import 'package:e_commerce/core/widgets/app_scafold.dart';
import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/core/widgets/loading_widget.dart';
import 'package:e_commerce/features/category_screen/data/repositories/get_all_categories_data.dart';
import 'package:e_commerce/features/category_screen/presentation/cubit/category_screen_cubit.dart';
import 'package:e_commerce/features/category_screen/presentation/widgets/category_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryScreenCubit(
          categoryPageRepo: getIt.get<GetAllCategoriesData>())
        ..getCategories(),
      child: BlocBuilder<CategoryScreenCubit, CategoryScreenState>(
        builder: (context, state) {
          return ScreenWrapper(
            appBar: CustomMainPageAppBar(
              appBarTitle: Text(
                'الانواع',
                style: AppTextStyle.medium,
              ),
            ),
            body: SafeArea(
                child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _devider(),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
                state is CategoryScreenLoading
                    ? const SliverToBoxAdapter(
                        child: Center(
                          child: LoadingWidget(),
                        ),
                      )
                    : const CategoryList(),
              ],
            )),
          );
        },
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

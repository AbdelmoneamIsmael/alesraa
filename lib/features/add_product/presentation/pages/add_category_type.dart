import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:e_commerce/core/routes/routers.dart';
import 'package:e_commerce/core/utilies/functions.dart';
import 'package:e_commerce/core/utilies/responsive_healper.dart';
import 'package:e_commerce/core/widgets/cashed_images.dart';
import 'package:e_commerce/core/widgets/category_item.dart';
import 'package:e_commerce/core/widgets/custom_appbar.dart';
import 'package:e_commerce/core/widgets/loading_widget.dart';
import 'package:e_commerce/core/widgets/small_no_data_widget.dart';
import 'package:e_commerce/core/widgets/toggel.dart';
import 'package:e_commerce/features/add_product/data/repositories/get_all_categories_repo.dart';
import 'package:e_commerce/features/add_product/domain/usecases/get_all_categories_usecase.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/select_category_cubit/cubit/create_category_cubit_cubit.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/select_category_cubit/cubit/get_all_categories.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/select_category_cubit/cubit/select_category_cubit_state.dart';
import 'package:e_commerce/features/add_product/presentation/pages/add_new_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CategoryType extends StatefulWidget {
  const CategoryType({super.key});

  @override
  State<CategoryType> createState() => _CategoryTypeState();
}

class _CategoryTypeState extends State<CategoryType> {
  bool newCategory = false;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreateNewCategoryCubit(context: context),
        ),
        BlocProvider(
            create: (context) => GetAllCategoryCubit(
                  getAllCategoryUseCase: GetAllCategoriesUseCase(
                    getAllCategorydomainRepo: getIt.get<GetAllCategoriesRepo>(),
                  ),
                )..getAllCategories()),
      ],
      child: Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: CustomAppBar(
                    title: newCategory ? "انشاء فئة جديدة" : 'اختار فئة المنتج',
                    actions: Row(
                      children: [
                        CustomToggel(
                          onChanged: (value) {
                            setState(() {
                              newCategory = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                newCategory
                    ? const SliverToBoxAdapter(child: AddNewCategory())
                    : const ShowAllCategories(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ShowAllCategories extends StatelessWidget {
  const ShowAllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllCategoryCubit, SelectCategoryCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SliverPadding(
          padding: EdgeInsets.all(16.responsiveHeight),
          sliver: state is GettingAllCategoies
              ? const SliverToBoxAdapter(
                  child: Center(child: LoadingWidget()),
                )
              : state is FailedToGetData
                  ? SliverToBoxAdapter(
                      child: NoDataWidget(
                        iconPath: IconAssets.errorSnakIcon,
                        title: state.message,
                        description: "فشل في الاتصال بالانترنت",
                        color: Colors.white,
                      ),
                    )
                  : state is SuccessToGetData
                      ? state.categories.isEmpty
                          ? const SliverToBoxAdapter(
                              child: NoDataWidget(
                                iconPath: IconAssets.searchIcon,
                                title: "لا يوجد نوع من الفئات",
                                color: Colors.white,
                                description:
                                    "لم يتم العثور علي اي نوع بعد قم بادخال بعض الانواع",
                              ),
                            )
                          : SliverGrid.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.6,
                                mainAxisSpacing: Spaces.height8,
                                crossAxisSpacing: Spaces.width8,
                              ),
                              itemBuilder: (context, index) => CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  GoRouter.of(context).push(
                                      PageRoutes.addCategoryKind,
                                      extra: state.categories[index]);
                                },
                                child: CategoryWidget(
                                  // backGroundColor: cubit.selectedType == index
                                  //     ? AppColor.grey100
                                  //     : Colors.white,
                                  childImage: CashedImage(
                                    url: state.categories[index].image!,
                                  ),
                                  text: state.categories[index].name!,
                                ),
                              ),
                              itemCount: state.categories.length,
                            )
                      : SliverToBoxAdapter(
                          child: 1.horizontalSpace,
                        ),
        );
      },
    );
  }
}

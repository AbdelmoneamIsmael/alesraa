import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/helper/ui_helper.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:e_commerce/core/utilies/functions.dart';
import 'package:e_commerce/core/utilies/responsive_healper.dart';
import 'package:e_commerce/core/widgets/category_item.dart';
import 'package:e_commerce/core/widgets/custom_appbar.dart';
import 'package:e_commerce/core/widgets/loading_widget.dart';
import 'package:e_commerce/core/widgets/small_no_data_widget.dart';
import 'package:e_commerce/core/widgets/toggel.dart';
import 'package:e_commerce/features/add_product/data/repositories/get_all_categories_repo.dart';
import 'package:e_commerce/features/add_product/domain/usecases/get_all_categories_usecase.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/select_category_cubit/cubit/get_all_categories.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/select_category_cubit/cubit/select_category_cubit_state.dart';
import 'package:e_commerce/features/add_product/presentation/pages/add_new_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CategoryType extends StatefulWidget {
  const CategoryType({super.key});

  @override
  State<CategoryType> createState() => _CategoryTypeState();
}

class _CategoryTypeState extends State<CategoryType> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      builder: (context, state) {
        AddProductCubit cubit = BlocProvider.of<AddProductCubit>(context);
        return Form(
          key: cubit.formKey,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: CustomAppBar(
                      title: 'Category Type',
                      actions: Row(
                        children: [
                          CustomToggel(
                            onChanged: (value) {
                              setState(() {
                                cubit.newCategory = value!;
                                PrinterHelper(
                                    " cubit.newCategoryKind ${cubit.newCategory}");
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  cubit.newCategory
                      ? const SliverToBoxAdapter(child: AddNewCategory())
                      : const ShowAllCategories(),
                ],
              ),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}

class ShowAllCategories extends StatelessWidget {
  const ShowAllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllCategoryCubit(
        getAllCategoryUseCase: GetAllCategoriesUseCase(
          getAllCategorydomainRepo: getIt.get<GetAllCategoriesRepo>(),
        ),
      )..getAllCategories(),
      child: BlocConsumer<GetAllCategoryCubit, SelectCategoryCubitState>(
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
                                itemBuilder: (context, index) =>
                                    CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  child: CategoryWidget(
                                    // backGroundColor: cubit.selectedType == index
                                    //     ? AppColor.grey100
                                    //     : Colors.white,
                                    childImage: CachedNetworkImage(
                                      imageUrl: state.categories[index].image!,
                                      placeholder: (context, url) {
                                        return const Center(
                                          child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 1.0,
                                            ),
                                          ),
                                        );
                                      },
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
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
      ),
    );
  }
}

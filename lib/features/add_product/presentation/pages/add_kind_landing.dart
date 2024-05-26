import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/const/images.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/icons_assets/icon_assets.dart';
import 'package:e_commerce/core/utilies/functions.dart';
import 'package:e_commerce/core/utilies/responsive_healper.dart';
import 'package:e_commerce/core/widgets/cashed_images.dart';
import 'package:e_commerce/core/widgets/custom_appbar.dart';
import 'package:e_commerce/core/widgets/loading_overlay.dart';
import 'package:e_commerce/core/widgets/loading_widget.dart';
import 'package:e_commerce/core/widgets/small_no_data_widget.dart';
import 'package:e_commerce/core/widgets/toggel.dart';
import 'package:e_commerce/core/widgets/type_item.dart';
import 'package:e_commerce/features/add_product/data/models/category_model.dart';
import 'package:e_commerce/features/add_product/data/repositories/get_all_categories_repo.dart';
import 'package:e_commerce/features/add_product/domain/usecases/get_all_kinds_usecase.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/select_category_kind_cubit/cubit/create_category_kind_cubit.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/select_category_kind_cubit/cubit/select_category_kind_cubit.dart';
// import 'package:e_commerce/features/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:e_commerce/features/add_product/presentation/pages/add_new_category_kind.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryKind extends StatefulWidget {
  const CategoryKind({super.key, required this.categoryModel});
  final AddProductCategoryModel categoryModel;
  @override
  State<CategoryKind> createState() => _CategoryKindState();
}

class _CategoryKindState extends State<CategoryKind> {
  bool newCategoryKind = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreateNewCategoryKindCubit(
              categoryModel: widget.categoryModel, context: context),
        ),
        BlocProvider(
          create: (context) => SelectCategoryKindCubit(
            categoryId: widget.categoryModel.categoryId!,
            getAllKindUseCase: GetAllKindUseCase(
              getAllCategorydomainRepo: getIt.get<GetAllCategoriesRepo>(),
            ),
          )..getAllKinds(),
        ),
      ],
      child: Stack(
        children: [
          Scaffold(
            body: Column(
              children: [
                CustomAppBar(
                  title: 'اخنار النوع',
                  actions: Row(
                    children: [
                      CustomToggel(
                        onChanged: (value) {
                          setState(() {
                            newCategoryKind = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                newCategoryKind
                    ? const AddNewCategoryKind()
                    : const Expanded(child: AllKindesWidgets())
              ],
            ),
          ),
          BlocBuilder<CreateNewCategoryKindCubit, SelectCategoryKindState>(
              builder: (context, state) {
            if (state is ActiveLoadingState) {
              return const LoadingOverlay();
            } else {
              return 0.verticalSpace;
            }
          })
        ],
      ),
    );
  }
}

class AllKindesWidgets extends StatelessWidget {
  const AllKindesWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectCategoryKindCubit, SelectCategoryKindState>(
      builder: (context, state) {
        return state is GettingAllCategoies
            ? const Center(child: LoadingWidget())
            : state is FailedToGetData
                ? NoDataWidget(
                    iconPath: IconAssets.errorSnakIcon,
                    title: state.message,
                    description: "فشل في الاتصال بالانترنت",
                    color: Colors.white,
                  )
                : state is SuccessToGetData
                    ? state.kinds.isEmpty
                        ? const NoDataWidget(
                            iconPath: IconAssets.searchIcon,
                            title: "لا يوجد نوع من الفئات",
                            color: Colors.white,
                            description:
                                "لم يتم العثور علي اي نوع بعد قم بادخال بعض الانواع",
                          )
                        : GridView.count(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            childAspectRatio: 1.15,
                            mainAxisSpacing: Spaces.height5,
                            crossAxisSpacing: Spaces.width5,
                            padding: EdgeInsets.all(Spaces.height16),
                            children: List.generate(
                              state.kinds.length,
                              (index) => CupertinoButton(
                                onPressed: () {},
                                padding: EdgeInsets.zero,
                                minSize: 0,
                                child: TypeItem(
                                  childImage:
                                      state.kinds[index].image!.isNotEmpty
                                          ? CashedImage(
                                              url: state.kinds[index].image!,
                                            )
                                          : const Image(
                                              image: AssetImage(logoImage),
                                            ),
                                  text: 'tornado ',
                                ),
                              ),
                            ),
                          )
                    : 1.verticalSpace;
      },
    );
  }
}

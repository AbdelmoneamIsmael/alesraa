import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/widgets/custom_appbar.dart';
import 'package:e_commerce/core/widgets/toggel.dart';
import 'package:e_commerce/core/widgets/type_item.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:e_commerce/features/add_product/presentation/widgets/add_new_category_kind.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryKind extends StatefulWidget {
  const CategoryKind({super.key});

  @override
  State<CategoryKind> createState() => _CategoryKindState();
}

class _CategoryKindState extends State<CategoryKind> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      builder: (context, state) {
        AddProductCubit cubit = BlocProvider.of<AddProductCubit>(context);
        return Form(
          key: cubit.kindFormKey,
          child: Column(
            children: [
              CustomAppBar(
                title: 'Category Kind',
                onBackPressed: () {
                  cubit.changeCurrentPage(isNext: false, context: context);
                },
                actions: Row(
                  children: [
                    CustomToggel(
                      onChanged: (value) {
                        setState(() {
                          cubit.newCategoryKind = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              cubit.newCategoryKind
                  ? const AddNewCategoryKind()
                  : Expanded(
                      child: GridView.count(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        childAspectRatio: 1.15,
                        mainAxisSpacing: Spaces.height5,
                        crossAxisSpacing: Spaces.width5,
                        padding: EdgeInsets.all(Spaces.height16),
                        children: List.generate(
                          20,
                          (index) => CupertinoButton(
                            onPressed: () {
                              cubit.changeKindSelection(index);
                            },
                            padding: EdgeInsets.zero,
                            minSize: 0,
                            child: TypeItem(
                              backGroundcolor: cubit.selectedKind == index &&
                                      cubit.selectedKind != null
                                  ? AppColors.grey100
                                  : Colors.white,
                              image: const AssetImage(
                                  'assets/images/samsungTv.avif'),
                              text: 'tornado ',
                            ),
                          ),
                        ),
                      ),
                    )
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}

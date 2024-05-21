import 'package:e_commerce/core/const/colors.dart';
import 'package:e_commerce/core/const/images.dart';
import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/strings.dart';
import 'package:e_commerce/core/helper/ui_helper.dart';
import 'package:e_commerce/core/widgets/category_item.dart';
import 'package:e_commerce/core/widgets/custom_appbar.dart';
import 'package:e_commerce/core/widgets/toggel.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:e_commerce/features/add_product/presentation/widgets/add_new_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  SliverToBoxAdapter(
                    child: cubit.newCategory
                        ? const AddNewCategory()
                        : _showTyeps(cubit),
                  )
                ],
              ),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  GridView _showTyeps(AddProductCubit cubit) {
    return GridView.count(
      padding: EdgeInsets.symmetric(
          vertical: Spaces.height * .015, horizontal: Spaces.width * .04444),
      crossAxisCount: 2,
      childAspectRatio: 1.6,
      mainAxisSpacing: Spaces.height8,
      crossAxisSpacing: Spaces.width8,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        8,
        (index) => CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            setState(() {
              cubit.changeSelection(index);
            });
          },
          child: CategoryWidget(
            backGroundColor:
                cubit.selectedType == index ? AppColor.grey100 : Colors.white,
            image: AssetImage(AssetsImages.markIcons[index]),
            text: markLabels[index],
          ),
        ),
      ),
    );
  }
}

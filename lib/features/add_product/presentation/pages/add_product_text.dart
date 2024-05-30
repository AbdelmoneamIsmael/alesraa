import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/const/text_style.dart';
import 'package:e_commerce/core/utilies/responsive_healper.dart';
import 'package:e_commerce/core/widgets/app_scafold.dart';
import 'package:e_commerce/core/widgets/buttom.dart';
import 'package:e_commerce/core/widgets/custom_appbar.dart';
import 'package:e_commerce/core/widgets/text_field_section.dart';
import 'package:e_commerce/features/add_product/data/models/category_model.dart';
import 'package:e_commerce/features/add_product/data/models/kind_model.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/create_create_product/cubit/create_product_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductText extends StatelessWidget {
  const ProductText(
      {super.key, required this.kindModel, required this.categoryModel});
  final AddProductKindModel kindModel;
  final AddProductCategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateProductCubit, CreateProductState>(
      builder: (context, state) {
        CreateProductCubit cubit = BlocProvider.of<CreateProductCubit>(context);
        cubit.kindModel = kindModel;
        cubit.categoryModel = categoryModel;
        return ScreenWrapper(
          body: Stack(
            children: [
              Form(
                key: cubit.productTextFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomAppBar(
                      title: 'اضافة منتج جديد',
                      // onBackPressed: () {
                      //   // cubit.changeCurrentPage(isNext: false, context: context);
                      // },
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        // keyboardDismissBehavior:
                        //     ScrollViewKeyboardDismissBehavior.onDrag,
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.all(Spaces.height16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('انت الان في صفحة انشاء المنتج',
                                  style: AppTextStyle.headerBold25),
                              _space(),
                              FieldSection(
                                onChange: (value) {
                                  cubit.productName.text = value;
                                },
                                controller: cubit.productName,
                                name: 'اسم المنتج',
                                isPassword: false,
                              ),
                              FieldSection(
                                onChange: (value) {
                                  cubit.productcode.text = value;
                                },
                                controller: cubit.productcode,
                                name: 'كود المنتج',
                                isPassword: false,
                                isRequered: false,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child: FieldSection(
                                  onChange: (value) {
                                    cubit.productDetails.text = value;
                                  },
                                  controller: cubit.productDetails,
                                  name: 'معلومات عن المنتج',
                                  keyboardType: TextInputType.multiline,
                                  isPassword: false,
                                  maxLines: 15,
                                ),
                              ),
                              100.verticalSpace,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 16.responsiveWidth,
                left: 16.responsiveWidth,
                bottom: 16.responsiveHeight,
                child: PrimeButtom(
                  text: 'التالي',
                  onTap: () {
                    cubit.confirmText(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  Widget _space() {
    return SizedBox(
      height: Spaces.height16,
    );
  }
}
